import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'entities/Cuenta.dart';
import 'GlobalVariables.dart' as globals;

class CrearCuenta extends StatefulWidget {
  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

//Creando posibles mensajes de fallos al crear una cuenta
final String correoRegistrado = "El correo ya está registrado.";
final String ineInvalida = "INE no válida.";
final String contrasenaCorta = "Tu contraseña debe tener 5 o más dígitos.";
final String correoIncorrecto = "Verifique su correo electrónico.";
final String restriccionEdad = "Ocupas mínimo 18 años.";

//Creando mensaje de éxito al crear la cuenta
final String cuentaCreada = "Cuenta creada!";

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

final format = DateFormat("yyyy-MM-dd");

//Espacio entre cada campo de texto en el registro
final double space = 24.0;

class _CrearCuentaState extends State<CrearCuenta> {
  @override
  Widget build(BuildContext context) {

    //Creando todos los TextFormFields
    for(int i = 0; i < controllersTextFields.length; i++){
      textFormFields.add(createTextFormField(controllersTextFields[i], hintsTextFields[i], inputTypeTextFields[i], hideText[i]));
    }

    //Creando una imagen para visualizar el avatar del usuario
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png')
      )
    );

    //DateTIme
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

            if (message == cuentaCreada) {
              //Agregando cuenta a la lista de cuentas
              globals.cuentas.add(Cuenta(
                  controllersTextFields[0].text, controllersTextFields[2].text,
                  controllersTextFields[4].text,
                  DateTime.parse(dateTimeController.text),
                  int.parse(controllersTextFields[1].text), ""));
              //Volviendo a la pantalla anterior
              Navigator.pop(context);
            }
          }
          on FormatException catch(e){

            Toast.show(restriccionEdad, context, duration: Toast.LENGTH_LONG,
                gravity: Toast.BOTTOM,
                backgroundColor: Colors.white,
                textColor: Colors.redAccent);
          }
        },
        color: Colors.lightBlueAccent,
        child: Text('Crear cuenta!', style: TextStyle(color: Colors.white))
      )
    );


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

  //Method to create a Textformfield
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

  //Función para validar que la cuenta dada es válida
  //Devuelve el string de cuentaCreada si es válida, sino un mensaje a desplegar
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
    int minAge = (DateTime.now().year - 18) * 365 + DateTime.now().month * 12 + DateTime.now().day;
    if( userAge > minAge) {
      message = restriccionEdad;
    }
    return message;
  }
}
