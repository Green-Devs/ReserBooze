import 'package:flutter/material.dart';

import 'entities/Antro.dart';


class HacerReserva extends StatefulWidget {

  final List<Antro> antroList;
  String antroSelected;

  HacerReserva({Key key, this.antroList, this.antroSelected}) : super(key: key);
  @override
  _HacerReservaState createState() => _HacerReservaState();
}

class _HacerReservaState extends State<HacerReserva> {
  String antroName = null;
  @override
  Widget build(BuildContext context) {

    List<Antro> antroList = widget.antroList;

    if(widget.antroSelected != null) {
      antroName = widget.antroSelected;
    }

    List<DropdownMenuItem<String>> antroMenu = loadAntroData(antroList);


    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
            backgroundColor:  Colors.transparent,
            radius: 48.0,
            child: Image.asset('assets/logo.png')
        )
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
            )
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
}
