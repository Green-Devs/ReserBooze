/**
 * HacerReserva.dart
 * versión 2.0
 * 
 * Archivo que crea un widget y permite al usuario
 * proseguir con el caso de uso RF07: Reservar mesa.
 * 
 * En este punto el usuario ya se enceuntra en el paso 2,
 * el 1 se realizó en la lista de antros. Aquí continúa y culmina
 * el caso de uso a como es explicado en el SDS.
 * Cabe mencionar que la aplicación ya le al usuario las horas que
 * están disponibles para reservación.
 */

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'GlobalVariables.dart' as globals;
import 'entities/Antro.dart';
import 'entities/Reserva.dart';
import 'package:flutter_app/BottomBarView.dart';

class HacerReserva extends StatefulWidget {
  //Elementos opcionales que pueden ser pasados al constructor del widget
  final List<Antro> antroList;
  Antro antroSelected;

  //Constructor del widget
  HacerReserva({Key key, this.antroList, this.antroSelected}) : super(key: key);
  @override
  _HacerReservaState createState() => _HacerReservaState();
}

class _HacerReservaState extends State<HacerReserva> {
  //para almacenar el nombre del antro del que se se hace la reserva
  String antroName = null;
  //para almacenar la hora a la que se hace la reserva
  String hour = null;
  //para almacenar el día que se hace la reserva
  String date = null;
  //la lista de los distintos antros disponibles
  List<DropdownMenuItem<String>> antroMenu = [];
  //la lista de las horas disponibles para cierto antro
  List<DropdownMenuItem<String>> hours = [];
  //la lista de los días disponibles para cierto antro
  List<DropdownMenuItem<String>> dates = [];
  @override
  Widget build(BuildContext context) {

    //Solo obtén el antro seleccionado si se mandó como parámetro
    if(widget.antroSelected != null) {
      antroName = widget.antroSelected.getNombre();
    }

    //Agrega todos los antros disponibles a la lista
    antroMenu = loadAntroData(widget.antroList);
    //Agrega las horas disponibles para reservación
    hours = loadHours();
    //Agrega los días disponibles para reservación
    dates = loadDates();

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
        child: Text('Reservar!', style : TextStyle(color: Colors.white)),
        onPressed: () {
          //Si se presiona y todos los campos están llenos
          if(fieldsAreFilled()) {
            //Crea una nueva reserva
            Reserva res = new Reserva(antroName, hour, date);
            //agrega la reserva a la lista
            globals.reservas.add(res);
            //ve a la pestaña de reservas
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BottomBarView(currentIndex: 1)),
            );
          }
          //Si faltan campos de completar, notifícale al usuario
          else {
            Toast.show("Favor de seleccionar un día y hora.", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.white, textColor: Colors.redAccent);
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
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 48),
            //La segunda row tiene un menú de selección para elegir el día de la reserva
            Row(
              children: <Widget>[
                Text("Día: "),
                DropdownButton<String>(
                  value: date,
                  items: dates,
                  hint: Text("día"),
                  iconSize: 35,
                  onChanged: (String value) {
                    date = value;
                  },
                )
              ],
            ),
            SizedBox(height: 48),
            //La tercera row tiene un menú de selección para elegir la hora de la reserva
            Row(
              children: <Widget>[
                Text("Hora: "),
                DropdownButton<String>(
                  value: hour,
                  items: hours,
                  hint: Text("hora"),
                  iconSize: 35,
                  onChanged: (String value) {
                    setState(() {
                      hour = value;
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
   * loadDates
   *
   * Función que devuelve una lista en el formato necesario con las fechas
   * disponibles de los antros. Como aun no estamos afiliados a los antros no tenemos
   * accesos a datos reales de disponibilidad
   *
   * Regresa:
   * Una lista con el formato necesario
   */
  List<DropdownMenuItem<String>> loadDates() {
    //Crea la lista a regresar
    List<DropdownMenuItem<String>> dataList = [];

    //Lista de los días de la semana
    List<String> dias = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];

    //Creando las fechas de disponibilidad
    for(int i = 0; i < 15; i++) {
      String innerDate = dias[i % dias.length] + " " + (i + 1).toString() + " de Diciembre";
      dataList.add( new DropdownMenuItem(
          child: Text(innerDate),
          value: innerDate));
    }
    //Devolver la lista
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
    return (hour != null && date != null) ? true : false;
  }
}


