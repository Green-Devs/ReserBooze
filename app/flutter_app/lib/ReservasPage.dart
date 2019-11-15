/**
 * HomePage.dart
 * versión 1.0
 *
 * HomePage cubre el caso detallado RF07: Crear Reserva,
 * el cual está especificado en el SDS.
 *
 * Debido al tiempo que se nos otorgó para realizar el proyecto,
 * este no cuenta con una base de datos, es un prototipo de alta fidelidad.
 * Sin embargo esto sirve como "Controlador de Reservas", el cual está
 * especificado en algunos casos de uso.
 */

import 'package:flutter/material.dart';
import 'entities/Reserva.dart';
import 'entities/Antro.dart';

class ReservasPage extends StatefulWidget {
  List<Reserva> reservasList = [];
  Reserva newReserva;

  ReservasPage({Key key, this.newReserva}) : super(key: key);

  @override
  _ReservasPageState createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage> {
  List<Reserva> reservasL = [Reserva("Avra", "10:00 PM", "5 de Diciembre")];

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
    List<Reserva> reservasL = [Reserva("Avra", "10:00 PM", "5 de Diciembre")];
    /* Futuro uso
    if (widget.newReserva !=  null) {
      reservasL.add(widget.newReserva);
    }
    */
    if (reservasL.length != null && reservasL.length > 0) {
      return Container(
          child: new ListView.builder(
            //itemCount will have the length of the list of reservas
              itemCount: reservasL.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    child: buildTripCard(context, index)
                );
              }
          )
      );
    }
    else {
      final noHayReservas = RichText(
        text: TextSpan(
          text: 'Aun no haces ninguna reserva',
          style: TextStyle(fontSize: 30.0),
        ),
      );

      return Scaffold(
          backgroundColor: Colors.redAccent,
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
   * Este es el código que construye las tarjetas donde estan las reservas
   */

  Widget buildTripCard(BuildContext context, int index) {
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
                          child: Image.asset(antroList[2].getPhotoPath())
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
}
