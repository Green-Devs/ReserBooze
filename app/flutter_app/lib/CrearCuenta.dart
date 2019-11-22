import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'GlobalVariables.dart';
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

//Creando mensaje de éxito al crear la cuenta
final String cuentaCreada = "Cuenta creada!";

class _CrearCuentaState extends State<CrearCuenta> {
  @override
  Widget build(BuildContext context) {
    //Array que almacenará todos los TextFormFields
    final textFormFields = [];

    //Array con todos los controladores de los TextFormFields
    final controllersTextFields = [TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController()];

    //Array con los  hints de cada controlador. Como lo posición coinciden se puede ver qué controla cada controlador: nombre, email, etc.
    final hintsTextFields = ["Nombre completo", "Fecha de nacimiento", "Número de INE", "Correo electrónico", "Confirmar correo electrónico", "Contraseña"];

    //El tipo dei input para cada textField
    final inputTypeTextFields = [TextInputType.text, TextInputType.datetime, TextInputType.number, TextInputType.emailAddress, TextInputType.emailAddress, TextInputType.text];

    //Cada booleana dice si se va a ocultar o no el texto cuando el usuario escriba
    final hideText = [false, false, false, false, false, true];


    //Creando una imagen para visualizar el avatar del usuario
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png')
      )
    );

    //Creando el botón para crear una cuenta
    final createAccountButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24)
        ),
        onPressed: () {
          String message = validateNewAccount(controllersTextFields[3].text, controllersTextFields[4].text, controllersTextFields[2].text, controllersTextFields[5].text);
          Toast.show(message, context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.white, textColor: Colors.redAccent);

          if(message == cuentaCreada) {
            //Agregando cuenta a la lista de cuentas
            globals.cuentas.add(Cuenta(controllersTextFields[0].text, controllersTextFields[3].text, controllersTextFields[5].text, DateTime.parse(controllersTextFields[1].text), int.parse(controllersTextFields[2].text), ""));
            //Volviendo a la pantalla anterior
            Navigator.pop(context);
          }
        }
      )
    );

    //Creando todos los TextFormFields
    for(int i = 0; i < controllersTextFields.length; i++){
      textFormFields.add(createTextFormField(controllersTextFields[i], hintsTextFields[i], inputTypeTextFields[i], hideText[i]));
    }

    return Scaffold();
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
  String validateNewAccount(String correo, String correoConfirmacion, String INE, String contrasena) {
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
    return message;
  }
}
