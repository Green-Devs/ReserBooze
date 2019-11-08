import 'package:flutter/material.dart';
import 'entities/Antro.dart';
import 'AntroDetailView.dart';

class AntrosPage extends StatefulWidget {
  @override
  _AntrosPageState createState() => _AntrosPageState();
}

class _AntrosPageState extends State<AntrosPage> {
  static final String loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";
  final List<Antro> antroList= [
    Antro("Strana", "10:00PM", "5:00AM", loremIpsum, "assets/strana.jpg", 10),
    Antro("Avra", "8:00PM", "3:00AM", loremIpsum, "assets/avra.jpg", 8.9),
    Antro("La Santa", "9:00PM", "3:33AM", loremIpsum, "assets/lasanta.jpg", 9.3),
    Antro("Pepper", "8:30PM", "4:00AM", loremIpsum, "assets/pepper.jpg", 9.5)
  ];

  Antro currentAntro;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: new ListView.builder(
        //itemCount will have the length of the list of antros
        itemCount: antroList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: buildTripCard(context, index),
            onTap: () {
              currentAntro = antroList[index];
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AntroDetailView(antro:currentAntro)),
              );
            }
          );
        }
      )
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final antro = antroList[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              children: <Widget>[
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

                Padding(
                  padding: const EdgeInsets.only(top: 1.0, bottom:4.0),
                  child: Row(children: <Widget> [
                    Text(antro.getNombre(), style: TextStyle(fontSize: 25.0)),
                    Spacer()
                  ]
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text("Horario: " + antro.getTiempoApertura() + " - " + antro.getTiempoLimite()),
                    Spacer()
                  ],
                  ),
                ),

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
