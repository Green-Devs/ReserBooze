import 'package:flutter/material.dart';
import 'GlobalVariables.dart';
import 'entities/Cuenta.dart';

class CrearCuenta extends StatefulWidget {
  @override
  _CrearCuentaState createState() => _CrearCuentaState();
}

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
}
