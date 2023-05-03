import 'package:flutter/material.dart';

class Tempo {
  int temp;
  DateTime date;
  HourFormat hour;
  String description;
  DateTime nextDate; 
  String weekday;
  String city;

  Tempo (
    this.city,
    this.temp,
    this.date,
    this.hour,
    this.description,
    this.nextDate,
    this.weekday, 
  );


}