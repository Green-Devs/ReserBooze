/**
 * HomePage.dart
 * versión 2.0
 *
 * HomePage cubre el caso detallado RF06: Ver promociones,
 * el cual está especificado en el SDS.
 *
 * Debido al tiempo que se nos otorgó para realizar el proyecto,
 * este no cuenta con una base de datos, es un prototipo de alta fidelidad.
 * Sin embargo esto sirve como "Controlador de promociones", el cual está
 * especificado en algunos casos de uso.
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/HacerPromo.dart';
import 'entities/Antro.dart';
import 'entities/Promo.dart';
import 'GlobalVariables.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Se regresa un contenedor con un detector de gestos que contiene
    //múltiples vistas de tarjeta(card) en una listView.

    //Se utilizara para revisar si la cuenta pertenece al admin
    final currentUser = globals.cuentaAutenticada;

    if (currentUser.getNombre() == "admin") {
      return Scaffold(
        body: Container(
            child: new ListView.builder(
              //itemCount tiene el largo de la lista de promociones
                itemCount: globals.promociones.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      child: buildTripCard(context, index)
                  );
                }
            )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HacerPromo(antroList: globals.antros, antroSelected: globals.antros[0])),
            );
          },
        ),
      );
    } else {
      return Container(
          child: new ListView.builder(
            //itemCount tiene el largo de la lista de promociones
              itemCount: globals.promociones.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    child: buildTripCard(context, index)
                );
              }
          )
      );
    }
  }

  /**
   * buildTripCard
   *
   * Código necesario para construir una promoción para una promoción de
   * un antro. Cuenta con foto, nombre, horario y descripción de promoción.
   *
   * Parámetros:
   * context: contexto de la aplicación en este instante
   * index: index de la promoción a desplegar
   *
   * Regresa:
   * El código para colocar la card correspondiente a la promoción
   */
  Widget buildTripCard(BuildContext context, int index) {
    final promo = globals.promociones[index];
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
                          child: Image.asset(promo.getAntro().getPhotoPath())
                      )
                    ])
                ),

                //Este child contiene el nombre del antro y le da formato
                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom:4.0),
                  child: Row(children: <Widget> [
                    Text(promo.getAntro().getNombre(), style: TextStyle(fontSize: 25.0)),
                    Spacer()
                  ]
                  ),
                ),

                //Este child contiene el horario de la promocion
                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text("Horario: " + promo.getHoraInicio() + "-" + promo.getHoraFinal()),
                    Spacer()
                  ],
                  ),
                ),

                //Este child contiene la descripción de la promoción
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text("Promocion: " + promo.getPromocion()),
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
