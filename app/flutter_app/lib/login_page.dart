import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'BottomBarView.dart';
import 'GlobalVariables.dart' as globals;
import 'entities/Cuenta.dart';
class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    addAccounts();

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor:  Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png')
      )
    );

    final email = TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular((32.0))
        )
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular((32.0))
          ),
      ),
    );

  final loginButton = Padding(
    padding: EdgeInsets.symmetric(vertical: 1.0),
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        if(hasAccount(emailController.text, passwordController.text)) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BottomBarView(currentIndex: 0,)),
          );
        }
        else {
          Toast.show("Correo y/o contraseña no coinciden.", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.white, textColor: Colors.redAccent);
        }
      },
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      child: Text('Log In', style : TextStyle(color: Colors.white)),
    ),
  );

    final createAccountButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Crear cuenta', style : TextStyle(color: Colors.white)),
      ),
    );

    final createAccountLabel = FlatButton(
        child: Text('¿No tienes cuenta?', style: TextStyle(color: Colors.black54)),
        onPressed: () {}
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            //SizedBox are like padding, space between
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            SizedBox(height: 24.0),
            createAccountLabel,
            createAccountButton,
          ],
        ),
      ),
    );
  }

  //Función para agregar todas las cuentas para futura autenticación. Pues no tenemos base de datos aún
  void addAccounts() {
    globals.cuentas.add(Cuenta('Pedro García', 'pedro.garcia95@gmail.com', '123', DateTime.now(), 12345, 'assets/profilepic.png'));
    globals.cuentas.add(Cuenta('Juan Pérez', 'juanperez@gmail.com', 'juanperez', DateTime.now(), 12346, 'assets/profilepic.png'));
    globals.cuentas.add(Cuenta('Juan Pérez2', 'a', 'a', DateTime.now(), 12346, 'assets/profilepic.png'));
  }

  //Función que checa si el usuario introducido está registrado y la contraseña es correcta
  bool hasAccount(String correo, String contrasena) {
    //Variable que almacena con valor booleano si el usuario está o no registrado
    bool isRegistered = false;

    for(Cuenta cuenta in globals.cuentas) {
      if(cuenta.getCorreo() == correo && cuenta.getContrasena() == contrasena) {
        isRegistered = true;
      }
    }
    return isRegistered;
  }
}