/***
 * HacerReserva.dart
 * versión 2.0
 * Archivo que crea un widget y permite al usuario
 * proseguir con el caso de uso RF05: Crear promociones, el cual
 * está especificado en el SDS
 * Solo el admin tiene acceso a este widget
 */

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'GlobalVariables.dart' as globals;
import 'entities/Antro.dart';
import 'entities/Promo.dart';
import 'package:flutter_app/BottomBarView.dart';

class HacerPromo extends StatefulWidget {
  //Elementos opcionales que pueden ser pasados al constructor del widget
  final List<Antro> antroList;
  Antro antroSelected;

  //Constructor del widget
  HacerPromo({Key key, this.antroList, this.antroSelected}) : super(key: key);
  @override
  _HacerPromoState createState() => _HacerPromoState();
}

class _HacerPromoState extends State<HacerPromo> {
  //para almacenar el nombre del antro del que se se hace la promocion
  String antroName = null;
  Antro selectedAntro = null;
  //para almacenar la hora de incio de la promocion
  String sHour = null;
  //para almacenar la hora de finalizacion de la promocion
  String eHour = null;
  //para almacenar la descripcion de la promocion
  String promoDesc = null;

  //la lista de los distintos antros disponibles
  List<DropdownMenuItem<String>> antroMenu = [];
  //la lista de las horas disponibles para empezar las promos en antros
  List<DropdownMenuItem<String>> shours = [];
  //la lista de las horas disponibles para acabar las promos en antros
  List<DropdownMenuItem<String>> ehours = [];

  List<DropdownMenuItem<String>> promoMenus = [];

  @override
  Widget build(BuildContext context) {

    //Agrega todos los antros disponibles a la lista
    antroMenu = loadAntroData(widget.antroList);
    //Agrega las horas disponibles para empezar promocion
    shours = loadHours();
    //Agrega las horas disponibles para teminar promocion
    ehours = loadHours();
    //Agrega las promociones a la lista de promociones
    promoMenus = loadPromoData();

    //Creando el logo de Reserbooze
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor:  Colors.transparent,
            radius: 48.0,
            child: Image.asset('assets/logo.png')
        )
    );

    //Creando el botón para reservar
    final reservationButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('¡Crear promocion!', style : TextStyle(color: Colors.white)),
        onPressed: () {
          //Si se presiona y todos los campos están llenos
          if(fieldsAreFilled()) {
            //Crea una nueva promocion
            Promo pro = new Promo(selectedAntro, sHour, eHour, promoDesc);
            //agrega la promocion a la lista
            globals.promociones.add(pro);
            //ve a la pestaña de promociones
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomBarView(currentIndex: 0)),
            );
          }
          //Si faltan campos de completar, notifícale al usuario
          else {
            Toast.show("Favor de seleccionar todos los datos.", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.white, textColor: Colors.redAccent);
          }
        },
      ),
    );

    //Regresando el widget para que el usuario pueda hacer su reserva
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top:48, left: 24, right: 24),
          children: <Widget>[
            logo,
            SizedBox(height: 48),
            //La primera row tiene un menú de selección para elegir al antro
            Row(
              children: <Widget>[
                Text("Antro: "),
                DropdownButton<String>(
                  value: antroName,
                  items: antroMenu,
                  hint: Text("antro"),
                  iconSize: 35,
                  onChanged: (String value) {
                    setState(() {
                      antroName = value;
                      for (int i = 0; i < widget.antroList.length ; i++) {
                        if (antroName == widget.antroList[i].getNombre()) {
                          selectedAntro = widget.antroList[i];
                        }
                      }
                    }
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 48),
            //La primera row tiene un menú de selección para elegir al antro
            Wrap(
              children: <Widget>[
                Text("Promocion: "),
                DropdownButton<String>(
                  value: promoDesc,
                  items: promoMenus,
                  hint: Text("antro"),
                  iconSize: 35,
                  onChanged: (String value) {
                    setState(() {
                      promoDesc = value;
                    }
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 48),
            //La segunda row tiene un menú de selección para elegir la hora en que empieza la promocion
            Row(
              children: <Widget>[
                Text("Hora para empezar: "),
                DropdownButton<String>(
                  value: sHour,
                  items: shours,
                  hint: Text("Hora inicio"),
                  iconSize: 35,
                  onChanged: (String value) {
                    setState(() {
                      sHour = value;
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 48),
            //La tercera row tiene un menú de selección para elegir la hora de la reserva
            Row(
              children: <Widget>[
                Text("Hora para terminar: "),
                DropdownButton<String>(
                  value: eHour,
                  items: ehours,
                  hint: Text("Hora fin"),
                  iconSize: 35,
                  onChanged: (String value) {
                    setState(() {
                      eHour = value;
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 48),
            //Colocando el botón para hacer la reserva
            reservationButton
          ],
        ),
      ),
    );
  }

  /**
   * loadAntroData
   *
   * Función que devuelve una lista en el formato necesario con los antros
   * disponibles. Como aun no estamos afiliados a los antros no tenemos
   * accesos a datos reales de disponibilidad
   *
   * Parámetros:
   * antros:  Una lista con los antros sin el formato adecuado para su uso
   *
   * Regresa:
   * Una lista con el formato necesario
   */
  List<DropdownMenuItem<String>> loadAntroData(List<Antro> antros) {
    //Crear lista a regresar
    List<DropdownMenuItem<String>> dataList = [];

    //Llenar lista
    for(int i = 0; i < antros.length; i++) {
      dataList.add(new DropdownMenuItem(
          child: Text(antros[i].getNombre()),
          value: antros[i].getNombre()
      ));
    }
    //regresar lista
    return dataList;
  }


  /**
   * loadPromoDato
   *
   * Función que devuelve una lista en el formato necesario con las promociones
   * disponibles. Como aun no estamos afiliados a los antros no tenemos
   * accesos a datos reales de disponibilidad
   *
   * Regresa:
   * Una lista con el formato necesario
   */
  List<DropdownMenuItem<String>> loadPromoData() {
    //Crear lista a regresar
    List<DropdownMenuItem<String>> dataList = [];

    //Llenar lista
    dataList.add(new DropdownMenuItem(
        child: Text("2 X 1 EN VODKA"),
        value: "2 X 1 EN VODKA"
    ));
    dataList.add(new DropdownMenuItem(
        child: Text("BOTELLA GRATIS EN GRUPO GRANDE"),
        value: "BOTELLA GRATIS EN GRUPO GRANDE"
    ));
    dataList.add(new DropdownMenuItem(
        child: Text("SHOTS DE TEQUILA A 50%"),
        value: "SHOTS DE TEQUILA A 50%"
    ));
    dataList.add(new DropdownMenuItem(
        child: Text("BARRA LIBRE"),
        value: "BARRA LIBRE"
    ));

    //regresar lista
    return dataList;
  }

  /**
   * loadHours
   *
   * Función que devuelve una lista en el formato necesario con las horas
   * disponibles de los antros. Como aun no estamos afiliados a los antros no tenemos
   * accesos a datos reales de disponibilidad
   *
   * Regresa:
   * Una lista con el formato necesario
   */
  List<DropdownMenuItem<String>> loadHours() {
    //Crea lista a regresar
    List<DropdownMenuItem<String>> dataList = [];

    //Llena lista
    for(int i = 10; i < 12; i++) {
      for(int j = 0; j < 60; j+=15) {
        String temp = (j >= 10) ? j.toString() : "0" + j.toString();
        String hour = i.toString() +":" + temp;
        dataList.add(new DropdownMenuItem(
            child: Text(hour),
            value: hour));
      }
    }
    //Regresa lista
    return dataList;
  }

  /**
   * fieldsAreFilled
   *
   * Función que revisa si todos los campos para la reserva están completos o no
   *
   * Regresa:
   * True si están todos llenos, false si falta al menos uno
   */
  bool fieldsAreFilled() {
    return (eHour != null && sHour != null && selectedAntro != null && promoDesc != null) ? true : false;
  }
}


