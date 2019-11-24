/**
 * PerfilPage.dart
 * versión 2.0
 *
 * Widget que le permite al usuario ver la información de su perfil.
 * En esta vista es donde se lleva a cabo el caso de uso extendido
 * RF04:Logout.
 * El cual es especificado en el SDS.
 */

import 'package:flutter/material.dart';
import 'entities/Cuenta.dart';
import 'LoginPage.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    //Cuenta usada para pruebas
    final testUser = Cuenta('Pedro García', 'pedro.garcia95@gmail.com', '123', DateTime.now(), 12345, 'assets/profilepic.png');

    //Creando una imagen de avatar
    final profilePic = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor:  Colors.transparent,
            radius: 80.0,
            child: Image.asset(testUser.getFotoCuenta())
        )
    );

    //Texto que muestra el nombre del usuario
    final name = RichText(
      text: TextSpan(
        text: 'Nombre:  ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: testUser.getNombre(), style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );

    //Texto que muestra el correo del usuario
    final userEmail = RichText(
      text: TextSpan(
        text: 'email:  ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: testUser.getCorreo(), style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );

    //Texto que muestra la fecha de nacimiento del usuario
    final fechaNacimiento = RichText(
      text: TextSpan(
        text: 'Fecha de Nacimiento:  ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: '1 de Octubre de 1996', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );

    //Texto que muestra que la INE del usuario fue verificada
    final credencialVerificada = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        padding: EdgeInsets.all(12),
        color: Colors.lightGreen,
        child: Text('INE verificada', style : TextStyle(color: Colors.greenAccent)),
      ),
    );

    //Código de la UI del botón para hacer logout
    final logoutButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Cerrar sesión', style : TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
    );

    //Regresando un Scaffold para que el usuario pueda ver su perfil
    //con los elementos ya mencionados
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              profilePic,
              name,
              userEmail,
              fechaNacimiento,
              credencialVerificada,
              SizedBox(height: 48),
              logoutButton
            ]
        )
      )
    );
  }
}
