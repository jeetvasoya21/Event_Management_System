import 'package:flutter/material.dart';
import 'package:event_management_app/Widgets/my_events.dart';


Column header(String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        text,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 51, 7, 108),
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 5),
      Container(
        height: 3,
        width: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 39, 2, 88),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ],
  );
}

InputDecoration design(String label, IconData icon) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: Color.fromARGB(255, 51, 7, 108), width: 2),
    ),
    filled: true,
    fillColor: const Color.fromARGB(255, 255, 255, 255),
  );
}


class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formkey = GlobalKey<FormState>();
  final MyData event = MyData(
    "",
    "",
    "",
    "",
    Image.asset('assets/placeholder.png'),
    null,
    "",
  );
  final TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
          key: _formkey,
          child: ListView(
            children: [
              header("Basic Details"),
              const SizedBox(height: 20),
              //Text("Basic Details", style: Theme.of(context).textTheme.headlineSmall),
              TextFormField(
                decoration: design('Event Name', Icons.event),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter event name";
                  }
                  return null;
                },
                onSaved: (value) {
                  event.name = value ?? "";
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: design('Tagline', Icons.description),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter event tagline";
                  }
                  return null;
                },
                onSaved: (value) {
                  event.tagline = value ?? "";
                },
              ),
              SizedBox(height: 20), 
              TextFormField(
                decoration: design('Description', Icons.description),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter event description";
                  }
                  return null;
                },
                onSaved: (value) {
                  event.description = value ?? "";
                },
              ),
              SizedBox(height: 40),
              header("Organizational Details"),
              const SizedBox(height: 20),
              TextFormField(
                decoration: design('College', Icons.school),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter college name";
                  }
                  return null;
                },
                onSaved: (value) {
                  event.college = value ?? "";
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: design('Department', Icons.business),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter department name";
                  }
                  return null;
                },
                onSaved: (value) {
                  event.department = value ?? "";
                },
              ),
              SizedBox(height: 40),
              header("Event Details"),
              const SizedBox(height: 20),
              TextFormField(
                controller: dateController,

                readOnly: true,

                enableInteractiveSelection: false,

                decoration: design('Date & Time', Icons.calendar_today),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please select date and time";
                  }
                  return null;
                },

                onTap: () async {
                  // REMOVE KEYBOARD / CURSOR
                  FocusScope.of(context).requestFocus(FocusNode());

                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );

                  if (pickedDate == null) return;

                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );

                  if (pickedTime == null) return;

                  DateTime finalDateTime = DateTime(
                    pickedDate.year,
                    pickedDate.month,
                    pickedDate.day,
                    pickedTime.hour,
                    pickedTime.minute,
                  );

                  setState(() {
                    event.date = finalDateTime;

                    dateController.text =
                        "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')} "
                        "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
                  });
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: design('Location', Icons.location_on),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter event location";
                  }
                  return null;
                },
                onSaved: (value) {
                  event.location = value ?? "";
                },
              ),
              Divider(height: 40, thickness: 2),
              //SizedBox(height: 40),
              header("Registration"),
              const SizedBox(height: 20),
              TextFormField(
                decoration: design('Registration Link', Icons.link),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter registration link";
                  }
                  return null;
                },
                onSaved: (value) {
                  event.registrationLink = value ?? "";
                },
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 39, 2, 88),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        myDataList.add(event);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Event added successfully')),
                        );
                        Navigator.pop(context);
                      }
                      
                    },
                    child: const Text('Add Event'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 39, 2, 88),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    onPressed: () {
                      _formkey.currentState!.reset();
                      dateController.clear();
                    },
                    child: const Text('Reset'),
                  ),

                ],
                
              ),
              SizedBox(width: 50),
              // Add more form fields for other event details
            ],
          ),
        ),
      );
    
  }
}
