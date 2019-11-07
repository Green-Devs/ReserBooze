import 'package:flutter/material.dart';

class AntrosPage extends StatefulWidget {
  @override
  _AntrosPageState createState() => _AntrosPageState();
}

class _AntrosPageState extends State<AntrosPage> {

  final List<String> antroNames = ["Avra", "La Santa", "Pepper", "Strana"];
  final List<String> antroPictures = ["assets/avra.jpg", "assets/lasanta.jpg", "assets/pepper.jpg", "assets/strana.jpg"];
  final List<String> antroSchedule = ["8:00PM-3:00AM", "9:00PM-3:33AM", "8:30PM-4:00AM", "10:00PM-5:00AM"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        //itemCount will have the length of the list of antros
        itemCount: antroNames.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
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

      )
    );
  }
}
