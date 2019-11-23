/**
 * AntroDetailView.dart
 * versión 1.0
 *
 * Esta clase muestra una descripción más amplia del antro.
 * En específico: su nombre, una foto, una descripción, horario,
 * y puntaje del 1 al 10.
 *
 * Este archivo es una parte del caso de uso RF07: "Reservar mesa",
 * el usuario en la lista de antros hizo click en uno para llegar a esta
 * pantalla. Esto es el primer paso en el flujo de eventos principales del
 * RF07.
 */


import 'package:flutter/material.dart';
import 'entities/Antro.dart';
import 'HacerReserva.dart';

class AntroDetailView extends StatefulWidget {
  //Aquí recibiremos el objeto antro que nos pasará la lista de antros
  final List<Antro> antroList;
 int antroIndex;

 /**
  * Constructor modificado, la llave "key" siempre se pasa por defecto,
  * también se le pone un segundo parámetro cuyo valor va a almacenarse
  * en el espacio designado para el objeto "antro"
  */
 AntroDetailView({Key key, this.antroList, this.antroIndex}) : super(key: key);

  @override
  _AntroDetailViewState createState() => _AntroDetailViewState();
}

class _AntroDetailViewState extends State<AntroDetailView> {

  @override
  Widget build(BuildContext context) {
    //Obteniendo el antro del widget
    Antro antro = widget.antroList[widget.antroIndex];

    //Código para hacer visible la imagen del antro
    final antroImage = Container(
      width: 320.0,
      height: 230.0,
      child: Image.asset(antro.getPhotoPath())
    );

    //Código de la UI del botón para hacer reservación
    final reservationButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Separar mesa', style : TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HacerReserva(antroList: widget.antroList, antroSelected: antro)),
          );
        },
      ),
    );

    //Este Scaffold contiene toda la vista lista para ser desplegada al usuario
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 40.0),
          children: <Widget>[
            Text(antro.getNombre(), style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            antroImage,
            Text(antro.getDescripcion(), style: TextStyle(fontSize: 16)),
            SizedBox(height: 24.0),
            Text("Horario: " + antro.getTiempoApertura() + " - " + antro.getTiempoLimite()),
            SizedBox(height: 16.0),
            Text("Puntaje: " + antro.getPuntajeFormato()),
            SizedBox(height: 48.0),
            reservationButton
          ]
        )
      )
    );
  }


}
