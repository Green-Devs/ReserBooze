import 'package:flutter/material.dart';

import 'entities/Antro.dart';
import 'package:flutter_app/BottomBarView.dart';


class HacerReserva extends StatefulWidget {

  final List<Antro> antroList;
  Antro antroSelected;


  HacerReserva({Key key, this.antroList, this.antroSelected}) : super(key: key);
  @override
  _HacerReservaState createState() => _HacerReservaState();
}

class _HacerReservaState extends State<HacerReserva> {
  String antroName = null;
  String hour = null;
  String date = null;
  List<DropdownMenuItem<String>> antroMenu = [];
  List<DropdownMenuItem<String>> hours = [];
  List<DropdownMenuItem<String>> dates = [];
  @override
  Widget build(BuildContext context) {

    if(widget.antroSelected != null) {
      antroName = widget.antroSelected.getNombre();
    }

    antroMenu = loadAntroData(widget.antroList);
    hours = loadHours();
    dates = loadDates();

    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor:  Colors.transparent,
            radius: 48.0,
            child: Image.asset('assets/logo.png')
        )
    );

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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomBarView(currentIndex: 1,)),
          );
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(top:48, left: 24, right: 24),
          children: <Widget>[
            logo,
            SizedBox(height: 48),
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
            reservationButton
          ],
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> loadAntroData(List<Antro> antros) {
    List<DropdownMenuItem<String>> dataList = [];

    for(int i = 0; i < antros.length; i++) {
      dataList.add(new DropdownMenuItem(
        child: Text(antros[i].getNombre()),
        value: antros[i].getNombre()
      ));
    }
    return dataList;
  }

  List<DropdownMenuItem<String>> loadHours() {
    List<DropdownMenuItem<String>> dataList = [];

    for(int i = 10; i < 12; i++) {
      for(int j = 0; j < 60; j+=15) {
        String temp = (j >= 10) ? j.toString() : "0" + j.toString();
        String hour = i.toString() +":" + temp;
          dataList.add(new DropdownMenuItem(
              child: Text(hour),
              value: hour));
      }
    }
    return dataList;
  }

  List<DropdownMenuItem<String>> loadDates() {
    List<DropdownMenuItem<String>> dataList = [];
    List<String> dias = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];

    for(int i = 0; i < 15; i++) {
      String innerDate = dias[i % dias.length] + " " + (i + 1).toString() + " de Diciembre";
      dataList.add( new DropdownMenuItem(
          child: Text(innerDate),
          value: innerDate));
    }
    return dataList;
  }
}
