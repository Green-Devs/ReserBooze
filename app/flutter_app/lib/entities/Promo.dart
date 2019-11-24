import 'package:flutter/material.dart';
import 'Antro.dart';

class Promo {
  Antro antro;
  String horaInicio;
  String horaFinal;
  String promocion;

  Promo(this.antro, this.horaInicio, this.horaFinal, this.promocion);

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