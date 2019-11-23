/**
 * AntrosPage.dart
 * versión 1.0
 *
 * AntrosPage cubre el caso detallado RF01: Ver lista de antros,
 * el cual está especificado en el SDS, el cual muestra como se muestran
 * los antros al usuario en nuestra aplicación.
 *
 * Debido al tiempo que se nos otorgó para realizar el proyecto,
 * este no cuenta con una base de datos.
 * Sin embargo esto sirve como "Controlador de antros", el cual está
 * especificado en algunos casos de uso.
 */

import 'package:flutter/material.dart';
import 'entities/Antro.dart';
import 'AntroDetailView.dart';

class AntrosPage extends StatefulWidget {
  @override
  _AntrosPageState createState() => _AntrosPageState();
}

class _AntrosPageState extends State<AntrosPage> {
  //Para no escribir lo mismo 4 veces hice un string
  static final String loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

 //lista de antros
  final List<Antro> antroList= [
    Antro("Strana", "10:00PM", "5:00AM", loremIpsum, "assets/strana.jpg", 10),
    Antro("Avra", "8:00PM", "3:00AM", loremIpsum, "assets/avra.jpg", 8.9),
    Antro("La Santa", "9:00PM", "3:33AM", loremIpsum, "assets/lasanta.jpg", 9.3),
    Antro("Pepper", "8:30PM", "4:00AM", loremIpsum, "assets/pepper.jpg", 9.5)
  ];

  //Objeto que será enviado si el usuario hace click en un antro
  Antro currentAntro;

  @override
  Widget build(BuildContext context) {

    //Este container tiene una lista que detecta clicks
    return Container(
      child: new ListView.builder(
        //itemCount will have the length of the list of antros
        itemCount: antroList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: buildTripCard(context, index),
            //Si el usuario hace click en un elemento
            onTap: () {
              //Guarda el antro en esa posición
              currentAntro = antroList[index];
              //ve a la vista detallada del antro al que se le hizo click
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AntroDetailView(antroList:antroList, antroIndex: index)),
              );
            }
          );
        }
      )
    );
  }

  /**
   * buildTripCard
   *
   * Este es el código necesario para construir una vista para
   * un antro. Cuenta con una foto, su nombre, horario y puntaje
   *
   * Parámetros:
   * context: contexto de la aplicación en este instante
   * index: Index del antro seleccionado
   *
   * Regresa:
   * La Tarjeta a desplegar
   */
  Widget buildTripCard(BuildContext context, int index) {
    final antro = antroList[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: <Widget>[
                //Este child del widget contiene la foto del antro y regula las dimensiones
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
                  child: Row(children: <Widget> [
                    Container(
                      width: 320.0,
                      height: 250.0,
                      child: Image.asset(antro.getPhotoPath())
                    )
                  ])
                ),

                //Este child contiene el nombre del antro y le da formato
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom:4.0),
                  child: Row(children: <Widget> [
                    Text(antro.getNombre(), style: TextStyle(fontSize: 25.0)),
                    Spacer()
                  ]
                  ),
                ),

                //Este child contiene el horario incluyendo apertura y cierre
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text("Horario: " + antro.getTiempoApertura() + " - " + antro.getTiempoLimite()),
                    Spacer()
                  ],
                  ),
                ),

                //Este child contiene el puntaje del antro
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text("Puntaje: " + antro.getPuntaje().toString()),
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
