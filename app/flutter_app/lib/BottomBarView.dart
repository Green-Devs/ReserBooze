/**
 * BottomBarView.dart
 * versión 2.0
 *
 * Este archivo maneja toda la lógica de el cambio de widgets(pantallas)
 * entre las 4 pantallas principales: Home, reservaciones, antros y perfil.
 * No corresponde a un caso en específico, solo da un contenedor para ellos y una
 * barra de navegación.
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/AntrosPage.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/PerfilPage.dart';
import 'package:flutter_app/ReservasPage.dart';

import 'entities/Reserva.dart';

class BottomBarView extends StatefulWidget {

  //Variables a recibir por parámetro opcionalmente en el constructor
  int calledWidget;
  int currentIndex;
  Reserva reserva;
  List<Reserva> reservas = new List<Reserva>();
  BottomBarView({Key key, this.currentIndex, this.reserva, this.reservas}) : super(key: key);

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}


class _BottomBarViewState extends State<BottomBarView> {

  //Lista de los widgets/pantallas. El índice coincide con la posición de los íconos
  final tabs = [
    HomePage(),
    ReservasPage(),
    AntrosPage(),
    PerfilPage()
  ];

  @override
  Widget build(BuildContext context) {

    //Checando si se recibió por parámetro una reserva
  if(widget.reserva != null) {
    //Si pasó eso, agrégala a las reservas
    widget.reservas.add(widget.reserva);
    print(widget.reserva.getAntroNombre());
    widget.reserva = null;
  }

    //retornando el widget con la barra de búsqueda y otro widget anidado según el caso
    return Scaffold(

      //Cuerpo tiene el widget anidado(la pantalla)
      body: tabs[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //Esto es el índice seleccionado actualmente, puede ser pasado por parámetro al widget de la barra de búsqueda
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        backgroundColor: Colors.white,
          //El tamaño del texto cuando haces click en él
          selectedFontSize: 15,
          //El tamaño del texto cuando no se le ha hecho click
          unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Reservas'),
            backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.local_bar),
            title: Text('Antros'),
            backgroundColor: Colors.blue
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
            backgroundColor: Colors.blue
          )
        ],
          /**
           * Este código de onTap es llamado cada vez
           * que se hace click en un elemento de la barra de
           * navegación.
           */
          onTap:(index){
          setState(() {
            widget.currentIndex = index;
          });
        }
      ),
    );
  }
}
