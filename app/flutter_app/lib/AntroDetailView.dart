import 'package:flutter/material.dart';
import 'entities/Antro.dart';

class AntroDetailView extends StatefulWidget {
 final Antro antro;

 AntroDetailView({Key key, this.antro}) : super(key: key);

  @override
  _AntroDetailViewState createState() => _AntroDetailViewState();
}

class _AntroDetailViewState extends State<AntroDetailView> {

  @override
  Widget build(BuildContext context) {
    Antro antro = widget.antro;

    final antroImage = Container(
      width: 320.0,
      height: 230.0,
      child: Image.asset(antro.getPhotoPath())
    );

    final reservationButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Separar mesa', style : TextStyle(color: Colors.white)),
      ),
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0),
          children: <Widget>[
            Text(antro.getName(), style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            antroImage,
            Text(antro.getDescription(), style: TextStyle(fontSize: 16)),
            SizedBox(height: 24.0),
            Text("Horario: " + antro.getStartHour() + "-" + antro.getEndHour()),
            SizedBox(height: 16.0),
            Text("Puntaje: " + antro.getScore()),
            SizedBox(height: 48.0),
            reservationButton
          ]
        )
      )
    );
  }
}
