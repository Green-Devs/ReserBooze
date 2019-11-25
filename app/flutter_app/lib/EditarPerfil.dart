/**
 * CrearCuenta.dart
 * versión 2.0
 *
 * Widget que despliega la pantalla que usan nuestros usuarios para crear
 * sus cuentas.
 * Corresponde al caso de uso detallado RF02: Crear Cuenta, el cual está
 * descrito en el SDS. Aquí el usuario ingresa los datos especificados en RF02
 * y valida que estén correctos, que la contraseña tenga cierta seguridad,
 * que el correo no esté registrado, etc.
 */

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'entities/Cuenta.dart';
import 'GlobalVariables.dart' as globals;

class EditarPerfil extends StatefulWidget {
  //Cuenta a editar
  Cuenta originalAccount;

  //Constructor del widget
  EditarPerfil({Key key, this.originalAccount}) : super(key: key);

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

//Creando posibles mensajes de fallos al crear una cuenta
final String correoRegistrado = "El correo ya está registrado.";
final String ineInvalida = "INE no válida.";
final String contrasenaCorta = "Tu contraseña debe tener 5 o más dígitos.";
final String correoIncorrecto = "Verifique su correo electrónico.";
final String restriccionEdad = "Ocupas mínimo 18 años.";

//Creando mensaje de éxito al crear la cuenta
final String cuentaCreada = "¡Cuenta modificada!";

//Array que almacenará todos los TextFormFields
final textFormFields = [];

//Array con todos los controladores de los TextFormFields
final controllersTextFields = [TextEditingController(),  TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController()];

//Array con los  hints de cada controlador. Como lo posición coinciden se puede ver qué controla cada controlador: nombre, email, etc.
final hintsTextFields = ["Nombre completo", "Número de INE", "Correo electrónico", "Confirmar correo electrónico", "Contraseña"];

//El tipo dei input para cada textField
final inputTypeTextFields = [TextInputType.text,  TextInputType.number, TextInputType.emailAddress, TextInputType.emailAddress, TextInputType.text];

//Cada booleana dice si se va a ocultar o no el texto cuando el usuario escriba
final hideText = [false, false, false, false, true];

//Para le fecha de nacimiento se usarán otras herramientas, y no ocupamos hints o inputType, así que se pone aparte
final dateTimeController = TextEditingController();

//Formato a usar para pedir la fecha de nacimiento del usuario
final format = DateFormat("yyyy-MM-dd");

//Espacio entre cada campo de texto en el registro
final double space = 24.0;

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    Cuenta oAccount = widget.originalAccount;

    //Creando todos los TextFormFields
    for(int i = 0; i < controllersTextFields.length; i++){
      textFormFields.add(createTextFormField(controllersTextFields[i], hintsTextFields[i], inputTypeTextFields[i], hideText[i]));
    }

    //Creando el logo de Reserbooze
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png')
      )
    );

    //El FormField para pedir la hora tiene que ser elaborarse diferente
    final dateTime = Column(
      children: <Widget>[
        Text('Fecha de nacimiento (${format.pattern})'),
        DateTimeField(
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100)
            );
          },
          controller: dateTimeController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0)
            ),
          ),
        )
      ],
    );

    //Creando el botón para crear una cuenta
    final createAccountButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        ),
        onPressed: () {
          try {
            String message = validateNewAccount(
                controllersTextFields[2].text, controllersTextFields[3].text,
                controllersTextFields[1].text, controllersTextFields[4].text,
                DateTime.parse(dateTimeController.text));
            Toast.show(message, context, duration: Toast.LENGTH_LONG,
                gravity: Toast.BOTTOM,
                backgroundColor: Colors.white,
                textColor: Colors.redAccent);

            Cuenta mAccount = new Cuenta(
                controllersTextFields[0].text, controllersTextFields[2].text,
                controllersTextFields[4].text,
                DateTime.parse(dateTimeController.text),
                int.parse(controllersTextFields[1].text), "assets/profilepic.png");

            if (message == cuentaCreada) {
              //Agregando cuenta a la lista de cuentas
              for (int i = 0; i < globals.cuentas.length; i++) {
                if (oAccount == globals.cuentas[i]) {
                  globals.cuentas[i] = mAccount;
                  globals.cuentaAutenticada = mAccount;
                }
              }

              //Limpiando los TextFormFields
              clearTextFormFields();
              //Volviendo a la pantalla anterior
              Navigator.pop(context);
            }
          }
          //Si hay un error en formato de fecha, se evita que la aplicación crashee
          on FormatException catch(e){

            //y como la fecha es la única que podría en un remoto caso,
            //causar error. Se le dice al usuario que la fecha no es válida
            Toast.show(restriccionEdad, context, duration: Toast.LENGTH_LONG,
                gravity: Toast.BOTTOM,
                backgroundColor: Colors.white,
                textColor: Colors.redAccent);
          }
        },
        color: Colors.lightBlueAccent,
        child: Text('Editar cuenta', style: TextStyle(color: Colors.white))
      )
    );

    //Regresando toda la UI dentro de un Scaffold
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: space),
            textFormFields[0],
            SizedBox(height: space),
            dateTime,
            SizedBox(height: space),
            textFormFields[1],
            SizedBox(height: space),
            textFormFields[2],
            SizedBox(height: space),
            textFormFields[3],
            SizedBox(height: space),
            textFormFields[4],
            SizedBox(height: space),
            createAccountButton
          ],
        )
      )
    );
  }

  /**
   * createTextFormField
   *
   * Método para crear un Textformfield que no sea para fecha.
   * Recibe los términos que cambian en cada FormField, esto con la finalidad de reutilizar código.
   *
   * parámetros:
   * controller: Controller para más adelante sacar datos del textformfield siendo creado
   * hint: Lo que se mostrará cuando no haya nada teclado
   * textInputType: Tipo de input; correo, numérico, etc.
   * hideText: decide si el texto se oculta o no, como en el caso de la contraseña
   *
   * returns:
   * El código del TextFormField ya creado
   */
  TextFormField createTextFormField(TextEditingController controller, String hint, TextInputType textInputType, bool hideText) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      autofocus: true,
      obscureText: hideText,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );
  }

  /**
   * validateNewAccount
   *
   * Función para validar que la cuenta dada es válida.
   * Devuelve el string de cuentaCreada si es válida, sino un mensaje a desplegar
   *
   * Parámetros:
   * correo:  correo dado por el usuario
   * correoConfirmacion: correo teclado por segunda vez por el usuario
   * INE: número de INE dado por el usuario
   * contrasena: contraseña dada por el usuario
   *
   * Returns:
   * Un string a como fue especificado en la descripción de la función.
   */
  String validateNewAccount(String correo, String correoConfirmacion, String INE, String contrasena, DateTime dateTime) {
    String message = cuentaCreada;

    //Validando que el correo no esté registrado
    for(Cuenta cuenta in globals.cuentas) {
      if(cuenta.getCorreo() == correo) {
        message = correoRegistrado;
      }
    }

    //Validando que la INE sea válida
    if(INE.length < 3) {
      message = ineInvalida;
    }

    //Checando que la contraseña sea lo suficientemente larga
    else if(contrasena.length < 5) {
      message = contrasenaCorta;
    }
    //Checando que los correos coincidan
    else if(correo != correoConfirmacion) {
      message = correoIncorrecto;
    }

    //Validando que el usuario tenga 18 años mínimo

    //Esto representa la edad del usuario
    int userAge = dateTime.year * 365 + 30 * dateTime.month + dateTime.day;

    //Esto representa la edad mínima (18 años)
    int minAge = (DateTime.now().year - 18) * 365 + DateTime.now().month * 30 + DateTime.now().day;

    //Si userAge es mayor significa que el usuario nació más adelante en el tiempo que "minAge"
    if( userAge > minAge) {
      message = restriccionEdad;
    }
    return message;
  }

  /**
   * clearTextFormFields
   *
   * Función que limpia los textos, porque si a alguien se le ocurre crear más de una cuenta
   * seguidas, los datos no se borrarían. Pero esto le da solución.
   */
  void clearTextFormFields() {
    dateTimeController.text = "";

    for(TextEditingController textEditingController in controllersTextFields) {
      textEditingController.text = "";
    }
  }
}
