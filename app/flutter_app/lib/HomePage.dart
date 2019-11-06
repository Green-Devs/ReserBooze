import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int iCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        //It says the index of the icon
        currentIndex: iCurrentIndex,
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
        onTap:(index){
          setState(() {
            iCurrentIndex = index;
          });
        }
      ),
    );
  }
}
