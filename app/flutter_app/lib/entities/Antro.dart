import 'package:flutter/material.dart';

class Antro {
  String name;
  String startHour;
  String endHour;
  String description;
  String photoPath;
  String score;


  Antro(this.name, this.startHour, this.endHour, this.description, this.photoPath, this.score);


  String getName(){
    return name;
  }

  String getStartHour(){
    return startHour;
  }

  String getEndHour() {
    return endHour;
  }

  String getDescription() {
    return description;
  }

  String getPhotoPhat() {
    return photoPath;
  }

  String getScore() {
    return score;
  }

  void setName(String name){
    this.name = name;
  }

  void setStartHour(String startHour) {
    this.startHour = startHour;
  }

  void setEndHour(String endHour) {
    this.endHour = endHour;
  }

  void setDescription(String description) {
    this.description = description;
  }

  void setPhotoPhat(String photoPath) {
    this.photoPath = photoPath;
  }

  void setScore(String score) {
    this.score = score;
  }
}