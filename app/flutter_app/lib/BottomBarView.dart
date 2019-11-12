/**
 * BottomBarView.dart
 * version 1.0
 *
 * Este archivo maneja toda la lógica de el cambio de widgets(pantallas)
 * entre las 4 pantallas principales: Home, reservaciones, antros y perfil
 */

import 'package:flutter/material.dart';
import 'package:flutter_app/AntrosPage.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/PerfilPage.dart';
import 'package:flutter_app/ReservasPage.dart';

class BottomBarView extends StatefulWidget {

  int calledWidget;
  int currentIndex;
  BottomBarView({Key key, this.currentIndex}) : super(key: key);

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}


class _BottomBarViewState extends State<BottomBarView> {

  //Index of the current selected tab


  //List of the widget. The index match the position of the icons
  final tabs = [
    HomePage(),
    ReservasPage(),
    AntrosPage(),
    PerfilPage()
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      //Body has the the widget(screen)
      body: tabs[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //It says the index of the icon
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        backgroundColor: Colors.white,
        //The size of the font when you click on it
          selectedFontSize: 15,
        //The size of the font when the item is unclicked
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
