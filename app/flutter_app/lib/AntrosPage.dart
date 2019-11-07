import 'package:flutter/material.dart';
import 'entities/Antro.dart';

class AntrosPage extends StatefulWidget {
  @override
  _AntrosPageState createState() => _AntrosPageState();
}

class _AntrosPageState extends State<AntrosPage> {
  final List<Antro> antroList= [
  Antro("Avra", "8:00PM", "3:00AM", "desc", "assets/avra.jpg", "10/10"),
    Antro("La Santa", "9:00PM", "3:33AM", "desc", "assets/lasanta.jpg", "10/10"),
    Antro("Pepper", "8:30PM", "4:00AM", "desc", "assets/pepper.jpg", "10/10"),
    Antro("Strana", "10:00PM", "5:00AM", "desc", "assets/strana.jpg", "10/10")
  ];


  @override
  Widget build(BuildContext context) {



    return Container(
      child: new ListView.builder(
        //itemCount will have the length of the list of antros
        itemCount: antroList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildTripCard(context, index);
        }
      )
    );
  }


  Widget buildTripCard(BuildContext context, int index) {
    return new Container(
      child: Card(
        child: Column(
            children: <Widget>[
              Text(index.toString()),
              Text(antroNames[index])
            ]
        ),
      ),
    );
  }
}
