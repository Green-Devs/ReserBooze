import 'package:flutter/material.dart';
import 'entities/Reserva.dart';

class ReservasPage extends StatefulWidget {
  List<Reserva> reservas = [];
  @override
  _ReservasPageState createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Reservas')
      )
    );
  }
}
