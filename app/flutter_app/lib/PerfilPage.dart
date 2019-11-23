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
    final testUser = Cuenta('Pedro García', 'pedro.garcia95@gmail.com', '123', DateTime.now(), 12345, 'assets/profilepic.png');

    final profilePic = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor:  Colors.transparent,
            radius: 80.0,
            child: Image.asset(testUser.getFotoCuenta())
        )
    );

    final name = RichText(
      text: TextSpan(
        text: 'Nombre:  ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: testUser.getNombre(), style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );

    final userEmail = RichText(
      text: TextSpan(
        text: 'email:  ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: testUser.getCorreo(), style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );

    final fechaNacimiento = RichText(
      text: TextSpan(
        text: 'Fecha de Nacimiento:  ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: '1 de Octubre de 1996', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );

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
