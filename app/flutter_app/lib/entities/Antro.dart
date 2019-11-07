import 'package:flutter/material.dart';

class Antro {
  final String name;
  final HourFormat startHour;
  final HourFormat endHour;
  final String description;
  final String photoPath;
  final String score;


  Antro(this.name, this.startHour, this.endHour, this.description, this.photoPath, this.score);
}