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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Text("${widget.antro.getName()}")
          ]
        )
      )
    );
  }
}
