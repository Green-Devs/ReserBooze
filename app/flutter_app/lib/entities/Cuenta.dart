import 'package:flutter/material.dart';

class Cuenta {
  String nombre;
  String correo;
  String contrasena;
  DateTime fechaNacimiento;
  int numeroIne;
  String fotoCuenta;


  Cuenta(this.nombre, this.correo, this.contrasena, this.fechaNacimiento, this.numeroIne, this.fotoCuenta);


  String getNombre(){
    return nombre;
  }

  String getCorreo(){
    return correo;
  }

  String getContrasena() {
    return contrasena;
  }

  DateTime getFechaNacimiento() {
    return fechaNacimiento;
  }

  int getNumeroIne() {
    return numeroIne;
  }

  String getFotoCuenta() {
    return fotoCuenta;
  }

  void setNombre(String nombre){
    this.nombre = nombre;
  }

  void setCorreo(String correo) {
    this.correo  = correo;
  }

  void setFechaNacimiento(DateTime fechaNaciemiento) {
    this.fechaNacimiento = fechaNacimiento;
  }

  void setNumeroIne(int numeroIne) {
    this.numeroIne = numeroIne;
  }

  void setFotoCuenta(String fotoCuenta) {
    this.fotoCuenta = fotoCuenta;
  }
}