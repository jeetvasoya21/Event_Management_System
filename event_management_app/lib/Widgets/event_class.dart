import 'package:flutter/material.dart';

class MyData {
  String name="";
  late Image image;
  String tagline="";
  String description="";
  String college="";
  String department="";
  DateTime? date;
  String location="";
  String registrationInfo="";
  String registrationLink="";
  MyData(
    this.name,
    this.tagline,
    this.college,
    this.department,
    this.image,
    this.date,
    this.location,
  );
}
