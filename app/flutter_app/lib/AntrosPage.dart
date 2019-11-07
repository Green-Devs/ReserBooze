import 'package:flutter/material.dart';
import 'entities/Antro.dart';

class AntrosPage extends StatefulWidget {
  @override
  _AntrosPageState createState() => _AntrosPageState();
}

class _AntrosPageState extends State<AntrosPage> {
  final List<Antro> antroList= [
    Antro("Strana", "10:00PM", "5:00AM", "desc", "assets/strana.jpg", "10/10"),
    Antro("Avra", "8:00PM", "3:00AM", "desc", "assets/avra.jpg", "10/10"),
    Antro("La Santa", "9:00PM", "3:33AM", "desc", "assets/lasanta.jpg", "10/10"),
    Antro("Pepper", "8:30PM", "4:00AM", "desc", "assets/pepper.jpg", "10/10")
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
                    Text(antro.getName(), style: TextStyle(fontSize: 25.0)),
                    Spacer()
                  ]
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 4.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text(antro.getStartHour() + "-" + antro.getEndHour()),
                    Spacer()
                  ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Row(children: <Widget>[
                    Text(antro.getScore()),
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
