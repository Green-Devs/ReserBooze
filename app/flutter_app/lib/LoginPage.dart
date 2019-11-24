/**
 * LoginPage
 * versión 2.0
 *
 * Primera pantalla que ve el usuario al abrir la apliación
 * si no tiene sesión iniciada.
 *
 * Este archivo cumple con el caso detallado RF03: Login. El cual
 * está especificado en el SDS. Su principal funcionalidad es verificar
 * que correo y contraseña coincidan, para llevar la usuario a la pantalla
 * principal.
 * De igual manera se puede hacer click en el botón de Crear cuenta para
 * iniciar el caso de uso RF02, el cual también está especificado en el SDS.
 */

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'BottomBarView.dart';
import 'CrearCuenta.dart';
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

    //Agregar cuentas manualmente porque no tenemos base de datos todavía
    addAccounts();

    //Para extrar información de los TextFormFields
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    //Creando el logo de Reserbooze
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor:  Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png')
      )
    );

    //Creando el TextFormField del correo
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

    //Creando el TextFormField de la contraseña
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

  //Creando el botón de inicio de sesión
  final loginButton = Padding(
    padding: EdgeInsets.symmetric(vertical: 1.0),
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {
        //Verificar si la cuenta existe
        if(hasAccount(emailController.text, passwordController.text)) {
          //Si existe, llévalo a la pantalla principal
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BottomBarView(currentIndex: 0,)),
          );
        }
        //Si no existe, dile que no coincide correo y/o contraseña
        else {
          Toast.show("Correo y/o contraseña no coinciden.", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.white, textColor: Colors.redAccent);
        }
      },
      padding: EdgeInsets.all(12),
      color: Colors.lightBlueAccent,
      child: Text('Log In', style : TextStyle(color: Colors.white)),
    ),
  );

    //Creando botón para crear cuentas
    final createAccountButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        //Te lleva directamente a otra pantalla/widget
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CrearCuenta()
            )
          );
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Crear cuenta', style : TextStyle(color: Colors.white)),
      ),
    );

    //Etiqueta que acompaña al botón para crear cuenta
    final createAccountLabel = Text(
      '¿No tienes cuenta?', style : TextStyle(color: Colors.black),
      textAlign: TextAlign.center,
    );

    //Aquí se regresa toda la pantalla/widget formado por los elementos ya descritos
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            //SizedBox son como padding, espacio en medio de elementos
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

  /**
   * addAccounts
   *
   * Función para agregar todas las cuentas para futura autenticación. Pues no tenemos base de datos aún.
   */
  void addAccounts() {
    globals.cuentas.add(Cuenta('Pedro García', 'pedro.garcia95@gmail.com', '123', DateTime.now(), 12345, 'assets/profilepic.png'));
    globals.cuentas.add(Cuenta('Juan Pérez', 'juanperez@gmail.com', 'juanperez', DateTime.now(), 12346, 'assets/profilepic.png'));
    globals.cuentas.add(Cuenta('Juan Pérez2', 'a', 'a', DateTime.now(), 12346, 'assets/profilepic.png'));
    globals.cuentas.add(Cuenta('admin', 'admin', 'admin', DateTime.now(), 12346, 'assets/profilepic.png'));
  }

  /**
   * hasAccount
   *
   * Función que checa si el usuario introducido está registrado y la contraseña es correcta
   *
   * Parámetros:
   * correo: Correo introducido por el usuario
   * contraseña: Contraseña introducida por el usuario
   *
   * Regresa:
   * True si la cuenta existe, false si no.
   */
  bool hasAccount(String correo, String contrasena) {
    //Variable que almacena con valor booleano si el usuario está o no registrado
    bool isRegistered = false;

    //Busca entre todas las cuentas
    for(Cuenta cuenta in globals.cuentas) {
      //Si la encuentras
      if(cuenta.getCorreo() == correo && cuenta.getContrasena() == contrasena) {
        isRegistered = true;

        //Ese será el usuario autenticado
        globals.cuentaAutenticada = cuenta;
      }
    }
    //Informa si la cuenta existe o no
    return isRegistered;
  }
}