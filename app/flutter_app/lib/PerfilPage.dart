import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    final profilePic = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor:  Colors.transparent,
            radius: 80.0,
            child: Image.asset('assets/profilepic.png')
        )
    );

    final name = RichText(
      text: TextSpan(
        text: 'Nombre:  ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: 'Pedro García', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );

    final userEmail = RichText(
      text: TextSpan(
        text: 'email:  ',
        style: DefaultTextStyle.of(context).style,
        children: <TextSpan>[
          TextSpan(text: 'pedro.garcia95@gmail.com', style: TextStyle(fontWeight: FontWeight.bold)),
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
              credencialVerificada
            ]
        )
      )
    );
  }
}
