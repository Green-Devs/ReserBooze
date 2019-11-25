/**
 * GlobalesVariables.dart
 * versión 2.0
 *
 * Dado que no contamos aún con base de datos,
 * hicimos algo que nos ayudara a acceder a datos a través
 * de los distintos widgets
 */

library project.globals;
import 'package:flutter_app/entities/Promo.dart';

import 'entities/Reserva.dart';
import 'entities/Cuenta.dart';
import 'entities/Promo.dart';
import 'entities/Antro.dart';

//Lista de reservas hechas por el usuario
List<Reserva> reservas = [];

//Lista que almacena las cuentas de los usuarios
List<Cuenta> cuentas = [];

//string default a ser desplegado para describir un antro
final String loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.";

//lista que almacena los antros
List<Antro> antros = [
  Antro("Strana", "10:00PM", "5:00AM", loremIpsum, "assets/strana.jpg", 10),
  Antro("Avra", "8:00PM", "3:00AM", loremIpsum, "assets/avra.jpg", 8.9),
  Antro("La Santa", "9:00PM", "3:33AM", loremIpsum, "assets/lasanta.jpg", 9.3),
  Antro("Pepper", "8:30PM", "4:00AM", loremIpsum, "assets/pepper.jpg", 9.5)
];

//Lista que almacena las promociones
List<Promo> promociones = [
  Promo(antros[3], "8:00PM", "12:00AM", "MUJERES TIENEN 2X1 EN BEBIDAS"),
  Promo(antros[1], "10:00PM", "3:00AM", "50% DE DESCUENTO EN TEQUILA!")
];

//Referencia al usuario atenticado
Cuenta cuentaAutenticada = null;




