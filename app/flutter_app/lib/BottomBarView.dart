import 'package:flutter/material.dart';
import 'package:flutter_app/AntrosPage.dart';
import 'package:flutter_app/HomePage.dart';
import 'package:flutter_app/PerfilPage.dart';
import 'package:flutter_app/ReservasPage.dart';

class BottomBarView extends StatefulWidget {
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView> {

  //Index of the current selected tab
  int currentIndex = 0;

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
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //It says the index of the icon
        currentIndex: currentIndex,
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

        //It is called every time an item is tapped.
          //Index is the one that was tapped

          /**
           * Este código de onTap es llamado cada vez
           * que se hace click en un elemento de la barra de
           * navegación.
           */
          onTap:(index){
          setState(() {
            currentIndex = index;
          });
        }
      ),
    );
  }
}
