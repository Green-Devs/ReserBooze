/**
 * HomePage.dart
 * versión 2.0
 *
 * En esta pestaña el usuario puede ver sus reservas que realizó
 * en el caso de uso RF07. De hecho esta vista forma parte del último paso
 * del RF07.
 *
 * Debido al tiempo que se nos otorgó para realizar el proyecto,
 * este no cuenta con una base de datos, es un prototipo de alta fidelidad.
 * Sin embargo esto sirve como "Controlador de Reservas", el cual está
 * especificado en algunos casos de uso.
 */

import 'package:flutter/material.dart';
import 'entities/Reserva.dart';
import 'entities/Antro.dart';
import 'GlobalVariables.dart' as globals;

class ReservasPage extends StatefulWidget {
  @override
  _ReservasPageState createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage> {
  List<Reserva> reservasL = [];

  //Para no escribir lo mismo 4 veces hice un string
  static final String loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

  //lista de antros
  final List<Antro> antroList= [
    Antro("Strana", "10:00PM", "5:00AM", loremIpsum, "assets/strana.jpg", 10),
    Antro("Avra", "8:00PM", "3:00AM", loremIpsum, "assets/avra.jpg", 8.9),
    Antro("La Santa", "9:00PM", "3:33AM", loremIpsum, "assets/lasanta.jpg", 9.3),
    Antro("Pepper", "8:30PM", "4:00AM", loremIpsum, "assets/pepper.jpg", 9.5)
  ];

  @override
  Widget build(BuildContext context) {
    //Haciendo fetch de todas nuestras reservas
    for(Reserva reserva in globals.reservas){
      reservasL.add(reserva);
    }

    //Si hay reservas
    if (reservasL.length != null && reservasL.length > 0) {
      //Regresa un contenedor con una lista de las reservas en forma de tarjeta
      return Container(
          child: new ListView.builder(
            //itemCount tiene el largo de la lista de reservas
              itemCount: reservasL.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    child: buildTripCard(context, index)
                );
              }
          )
      );
    }
    //Si no hay reservas
    else {
      //Crea un texto para mostrar que no hay reservas
      final noHayReservas = RichText(
        text: TextSpan(
          text: 'Aun no haces ninguna reserva.',
          style: TextStyle(fontSize: 30.0, color: Colors.lightBlueAccent),
        ),
      );

      //Infórmale al usuario que no ha hecho reservas.
      return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 24.0, right: 24.0),
                  children: <Widget>[
                    noHayReservas,
                  ]
              )
          )
      );
    }
  }

  /**
   * buildTripCard
   *
   * Código que construye cada tarjeta donde se muestra una reserva.
   *
   * Parámetros:
   * context: Contexto de la aplicación justo ahora
   * index: Índice de la reserva a desplegar en formato de tarjeta
   */
  Widget buildTripCard(BuildContext context, int index) {
    //Obtén la reserva a desplegar
    final reserva = reservasL[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                    //Este child del widget contiene la foto del antro y regula las dimensiones
                    child: Row(children: <Widget> [
                      Container(
                          width: 320.0,
                          height: 250.0,
                          child: Image.asset(getAntroFromName(reserva.getAntroNombre()).getPhotoPath())
                      )
                    ])
                ),

                //Este child contiene el nombre del antro y le da formato
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom:4.0),
                  child: Row(children: <Widget> [
                    Text(reserva.getAntroNombre(), style: TextStyle(fontSize: 25.0)),
                    Spacer()
                  ]
                  ),
                ),

                //Este child contiene el día de la reserva
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text("Día: " + reserva.getAntroFecha()),
                    Spacer()
                  ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    //Este child contiene la hora de la reserva
                    Text("Hora: " + reserva.getAntroHora()),
                    Spacer()
                  ],
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }

  /**
   * getAntroFromName
   *
   * Función para obtener el objeto antro a partir de su nombre
   *
   * Parámetros:
   * name:  Nombre del antro
   *
   * Regresa:
   * antro correspondiente al nombre name
   */
  Antro getAntroFromName(String name) {
    Antro antroSelected;
    
    for(Antro antro in antroList){
      if(antro.getNombre() == name) {
        antroSelected = antro;
      }
    }
    return antroSelected;
  }
}
