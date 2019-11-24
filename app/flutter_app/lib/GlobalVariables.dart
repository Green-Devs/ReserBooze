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

//Lista de reservas hechas por el usuario
List<Reserva> reservas = [];

//Lista que almacena las cuentas de los usuarios
List<Cuenta> cuentas = [];

//Lista que almacena las promociones
List<Promo> promociones = [];

//Referencia al usuario atenticado
Cuenta cuentaAutenticada = null;




