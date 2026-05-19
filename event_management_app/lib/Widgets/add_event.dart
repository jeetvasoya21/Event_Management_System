import 'package:flutter/material.dart';


class EventForm{
  String name="";
  late Image image;
  String tagline="";
  String description="";
  String college="";
  String department="";
  DateTime? date;
  TimeOfDay? time;
  String venue="";
  String registrationInfo="";
  String contactInfo="";
  String registrationLink="";
  String eventType="";
}

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  final _formkey=GlobalKey<FormState>();
  final EventForm eventForm=EventForm();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: _formkey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Event Name',
                ),
                onSaved: (value){
                  eventForm.name=value??"";
                },
              ),
              // Add more form fields for other event details
            ],
          )
      ),
    ),
    );
  }
}