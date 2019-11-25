/**
 * Promo.dart
 * versión 1.0
 *
 * La clase Promo corresponde al componente 3.4 especificada en el SDS,
 * donde se puede encontrar una descripción más detallada de la clase.
 * Su función principal es guardar datos que toda promo debe tener al
 * formar parte de nuestra aplicación. Adicional a lo especificado en el
 * SDS, se agregaron funciones extras en esta etapa de implementación
 */

import 'package:flutter/material.dart';
import 'Antro.dart';

class Promo {
  Antro antro;
  String horaInicio;
  String horaFinal;
  String promocion;

  /**
   * Constructor de la clase Promo. Dart permite realizar constructores
   * con solo poner las variables del objeto en los parámetros
   */
  Promo(this.antro, this.horaInicio, this.horaFinal, this.promocion);

  // getters

  Antro getAntro(){
    return antro;
  }

  String getHoraInicio(){
    return horaInicio;
  }

  String getHoraFinal() {
    return horaFinal;
  }

  String getPromocion() {
    return promocion;
  }
  
  // setters

  void setAntro(Antro antro){
    this.antro = antro;
  }

  void setHoraInicio(String horaInicio) {
    this.horaInicio  = horaInicio;
  }

  void setHoraFinal(String horaFinal) {
    this.horaFinal = horaFinal;
  }

  void setPromocion(String promocion) {
    this.promocion = promocion;
  }

}