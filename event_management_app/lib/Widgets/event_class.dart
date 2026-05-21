import 'package:flutter/material.dart';

class MyData {
  String name="";
   Image image=Image.asset('assets/placeholder.png');
  String tagline="";
  String description="";
  String college="";
  String department="";
  DateTime? date;
  String location="";
  String registrationInfo="";
  String registrationLink="";
  MyData({
    required this.name,
    required this.tagline,
    required this.college,
    required this.department,
    //required this.image,
    required this.date,
    required this.location,
    required this.registrationInfo,
    required this.description,
    required this.registrationLink,
  }
  );
  Map<String,dynamic> toJson(){
    return {
      'name': name,
      'tagline': tagline,
      'college': college,
      'department': department,
      'date': date?.toIso8601String(),
      'location': location,
      'registrationInfo': registrationInfo,
      'description': description,
      'registrationLink': registrationLink,
    };
  }
}
