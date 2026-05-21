import 'package:flutter/material.dart';
import 'package:event_management_app/Widgets/event_class.dart';

class AddEvent extends StatefulWidget {

  final Function(MyData) addEvent;

  const AddEvent({
    super.key,
    required this.addEvent,
  });

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

  /// SECTION HEADER
  Column header(String text) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(
          text,

          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB3E5FC),
          ),

          textAlign: TextAlign.start,
        ),

        const SizedBox(height: 6),

        Container(
          height: 3,
          width: 140,

          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF81D4FA),
                Color.fromARGB(255, 0, 180, 216),
              ],
            ),

            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }

  /// INPUT FIELD DESIGN
  InputDecoration design(String label, IconData icon) {

    return InputDecoration(

      labelText: label,

      labelStyle: const TextStyle(
        color: Colors.white70,
      ),

      prefixIcon: Icon(
        icon,
        color: const Color(0xFF81D4FA),
      ),

      filled: true,

      fillColor: const Color.fromARGB(255, 20, 30, 48),

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),

        borderSide: BorderSide(
          color: Colors.white.withAlpha((0.08*255).round()),
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),

        borderSide: BorderSide(
          color: Colors.white.withAlpha((0.08*255).round()),
        ),
      ),

      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),

        borderSide: BorderSide(
          color: Color(0xFF81D4FA),
          width: 2,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),

        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),

        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
    );
  }

  final _formkey = GlobalKey<FormState>();

  final TextEditingController dateController =
      TextEditingController();

  final TextEditingController nameController =
      TextEditingController();

  final TextEditingController taglineController =
      TextEditingController();

  final TextEditingController descriptionController =
      TextEditingController();

  final TextEditingController collegeController =
      TextEditingController();

  final TextEditingController departmentController =
      TextEditingController();

  final TextEditingController locationController =
      TextEditingController();

  final TextEditingController registrationInfoController =
      TextEditingController();

  final TextEditingController registrationLinkController =
      TextEditingController();

  @override
  void dispose() {

    dateController.dispose();
    nameController.dispose();
    taglineController.dispose();
    descriptionController.dispose();
    collegeController.dispose();
    departmentController.dispose();
    locationController.dispose();
    registrationInfoController.dispose();
    registrationLinkController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF081B2A),

      body: Container(

        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            colors: [
              Color.fromARGB(255, 1, 36, 57),
              Color.fromARGB(228, 21, 0, 46),
            ],
          ),
        ),

        child: SafeArea(

          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Form(

              key: _formkey,

              child: ListView(

                children: [

                  /// TOP BAR
                  Row(

                    mainAxisAlignment:
                        MainAxisAlignment.start,

                    children: [

                      Container(

                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha((0.06*255).round()),

                          borderRadius:
                              BorderRadius.circular(12),
                        ),

                        child: IconButton(

                          onPressed: () {
                            Navigator.pop(context);
                          },

                          icon: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF81D4FA),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Text(
                        'Add New Event',

                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFB3E5FC),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Container(
                    height: 3,
                    width: 160,

                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF81D4FA),
                          Color.fromARGB(255, 0, 180, 216),
                        ],
                      ),

                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// BASIC DETAILS
                  header("Basic Details"),

                  const SizedBox(height: 22),

                  TextFormField(
                    controller: nameController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Event Name',
                      Icons.event,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: taglineController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Tagline',
                      Icons.description,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event tagline";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: descriptionController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Description',
                      Icons.description,
                    ),

                    maxLines: 4,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event description";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  /// ORGANIZATIONAL DETAILS
                  header("Organizational Details"),

                  const SizedBox(height: 22),

                  TextFormField(
                    controller: collegeController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'College',
                      Icons.school,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter college name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: departmentController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Department',
                      Icons.business,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter department name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  /// EVENT DETAILS
                  header("Event Details"),

                  const SizedBox(height: 22),

                  TextFormField(
                    controller: dateController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    readOnly: true,

                    enableInteractiveSelection: false,

                    decoration: design(
                      'Date & Time',
                      Icons.calendar_today,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please select date and time";
                      }
                      return null;
                    },

                    onTap: () async {

                      FocusScope.of(context)
                          .requestFocus(FocusNode());

                      DateTime? pickedDate =
                          await showDatePicker(

                        context: context,

                        initialDate: DateTime.now(),

                        firstDate: DateTime(2000),

                        lastDate: DateTime(2101),

                        builder: (context, child) {

                          return Theme(

                            data: Theme.of(context).copyWith(

                              colorScheme:
                                  const ColorScheme.dark(

                                primary: Color(0xFF81D4FA),

                                onPrimary:
                                    Color.fromARGB(255, 21, 0, 46),

                                surface:
                                    Color.fromARGB(255, 20, 30, 48),

                                onSurface: Colors.white,
                              ),
                            ),

                            child: child!,
                          );
                        },
                      );

                      if (!mounted) return;
                      if (pickedDate == null) return;

                      TimeOfDay? pickedTime =
                          await showTimePicker(

                        context: context,

                        initialTime: TimeOfDay.now(),

                        builder: (context, child) {

                          return Theme(

                            data: Theme.of(context).copyWith(

                              colorScheme:
                                  const ColorScheme.dark(

                                primary: Color(0xFF81D4FA),

                                onPrimary:
                                    Color.fromARGB(255, 21, 0, 46),

                                surface:
                                    Color.fromARGB(255, 20, 30, 48),

                                onSurface: Colors.white,
                              ),
                            ),

                            child: child!,
                          );
                        },
                      );

                      if (!mounted) return;
                      if (pickedTime == null) return;

                      setState(() {

                        dateController.text =
                            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')} "
                            "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: locationController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Location',
                      Icons.location_on,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter event location";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  /// REGISTRATION
                  header("Registration"),

                  const SizedBox(height: 22),

                  TextFormField(
                    controller: registrationInfoController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Registration Info',
                      Icons.info,
                    ),

                    maxLines: 4,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter registration info";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  TextFormField(
                    controller: registrationLinkController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Registration Link',
                      Icons.link,
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter registration link";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 35),

                  /// BUTTONS
                  Row(

                    mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,

                    children: [

                      /// ADD EVENT BUTTON
                      Expanded(
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(

                            elevation: 6,

                            backgroundColor:
                                const Color(0xFF81D4FA),

                            foregroundColor:
                                const Color.fromARGB(
                                    255,
                                    21,
                                    0,
                                    46),

                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 16,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(14),
                            ),
                          ),

                          onPressed: () {

                            if (_formkey.currentState!
                                .validate()) {

                              _formkey.currentState!.save();

                              MyData event = MyData(
                                name: nameController.text,

                                tagline:
                                    taglineController.text,

                                description:
                                    descriptionController.text,

                                college:
                                    collegeController.text,

                                date: DateTime.parse(
                                    dateController.text),

                                department:
                                    departmentController.text,

                                location:
                                    locationController.text,

                                registrationInfo:
                                    registrationInfoController
                                        .text,

                                registrationLink:
                                    registrationLinkController
                                        .text,
                              );

                              widget.addEvent(event);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(

                                SnackBar(

                                  backgroundColor:
                                      const Color.fromARGB(
                                          255,
                                          20,
                                          30,
                                          48),

                                  content: const Text(
                                    'Event added successfully',

                                    style: TextStyle(
                                      color:
                                          Color(0xFF81D4FA),
                                    ),
                                  ),
                                ),
                              );

                              Navigator.pop(context);
                            }
                          },

                          child: const Text(
                            'Add Event',

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      /// RESET BUTTON
                      Expanded(
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(

                            elevation: 0,

                            backgroundColor:
                                const Color.fromARGB(
                                    255,
                                    20,
                                    30,
                                    48),

                            foregroundColor:
                                const Color(0xFF81D4FA),

                            side: const BorderSide(
                              color: Color(0xFF81D4FA),
                            ),

                            padding:
                                const EdgeInsets.symmetric(
                              vertical: 16,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(14),
                            ),
                          ),

                          onPressed: () {

                            _formkey.currentState!.reset();

                            nameController.clear();
                            taglineController.clear();
                            descriptionController.clear();
                            collegeController.clear();
                            departmentController.clear();
                            locationController.clear();
                            registrationInfoController.clear();
                            registrationLinkController.clear();
                            dateController.clear();
                          },

                          child: const Text(
                            'Reset',

                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}