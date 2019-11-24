/**
 * main.dart
 * versión 2.0
 *
 * Archivo que se ejecuta al correr la aplicación
 */

import 'package:flutter/material.dart';
import 'LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reserbooze',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Tema de la aplicación
        primarySwatch: Colors.blue,
      ),
      //Primer widget a ser cargado cuando se ejecuta la aplicación
      home: LoginPage(),
    );
  }
}
