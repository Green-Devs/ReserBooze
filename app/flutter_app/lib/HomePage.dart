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
import 'entities/Antro.dart';
import 'entities/Promo.dart';
import 'GlobalVariables.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //string default a ser desplegado para describir un antro
  static final String loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
  //lista de antros
  static final List<Antro> antroList= [
    Antro("Strana", "10:00PM", "5:00AM", loremIpsum, "assets/strana.jpg", 10),
    Antro("Avra", "8:00PM", "3:00AM", loremIpsum, "assets/avra.jpg", 8.9),
    Antro("La Santa", "9:00PM", "3:33AM", loremIpsum, "assets/lasanta.jpg", 9.3),
    Antro("Pepper", "8:30PM", "4:00AM", loremIpsum, "assets/pepper.jpg", 9.5)
  ];

  //Lista de promociones
  final List<Promo> promoList = [
    Promo(antroList[3], "8:00PM", "12:00AM", "MUJERES TIENEN 2X1 EN BEBIDAS"),
    Promo(antroList[1], "10:00PM", "3:00AM", "50% DE DESCUENTO EN TEQUILA!"),
  ];

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
                itemCount: promoList.length,
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
            print('Clicked');
          },),
      );
    } else {
      return Container(
          child: new ListView.builder(
            //itemCount tiene el largo de la lista de promociones
              itemCount: promoList.length,
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
    final promo = promoList[index];
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
