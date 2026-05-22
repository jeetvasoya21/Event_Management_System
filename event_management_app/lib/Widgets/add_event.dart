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

  /// HEADER
  Column header(String text) {

    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        Text(
          text,

          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFFB3E5FC),
          ),
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

            borderRadius:
                BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }

  /// INPUT DESIGN
  InputDecoration design(
    String label,
    IconData icon,
  ) {

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

      fillColor:
          const Color.fromARGB(255, 20, 30, 48),

      contentPadding:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 18,
      ),

      border: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),

        borderSide: BorderSide(
          color: Colors.white.withAlpha(
            (0.08 * 255).round(),
          ),
        ),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),

        borderSide: BorderSide(
          color: Colors.white.withAlpha(
            (0.08 * 255).round(),
          ),
        ),
      ),

      focusedBorder:
          const OutlineInputBorder(

        borderRadius:
            BorderRadius.all(
          Radius.circular(14),
        ),

        borderSide: BorderSide(
          color: Color(0xFF81D4FA),
          width: 2,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius:
            BorderRadius.circular(14),

        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),

      focusedErrorBorder:
          OutlineInputBorder(

        borderRadius:
            BorderRadius.circular(14),

        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          const Color(0xFF081B2A),

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

            padding:
                const EdgeInsets.all(16),

            child: Form(

              key: _formkey,

              child: ListView(

                children: [

                  /// TOP BAR
                  Row(

                    children: [

                      Container(

                        decoration:
                            BoxDecoration(

                          color: Colors.white
                              .withAlpha(
                            (0.06 * 255)
                                .round(),
                          ),

                          borderRadius:
                              BorderRadius
                                  .circular(12),
                        ),

                        child: IconButton(

                          onPressed: () {
                            Navigator.pop(
                                context);
                          },

                          icon: const Icon(
                            Icons.arrow_back,
                            color:
                                Color(0xFF81D4FA),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Text(
                        'Add New Event',

                        style: TextStyle(
                          fontSize: 24,
                          fontWeight:
                              FontWeight.bold,
                          color:
                              Color(0xFFB3E5FC),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Container(
                    height: 3,
                    width: 160,

                    decoration: BoxDecoration(

                      gradient:
                          const LinearGradient(
                        colors: [
                          Color(0xFF81D4FA),
                          Color.fromARGB(
                              255,
                              0,
                              180,
                              216),
                        ],
                      ),

                      borderRadius:
                          BorderRadius
                              .circular(10),
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// BASIC DETAILS
                  header("Basic Details"),

                  const SizedBox(height: 22),

                  /// EVENT NAME
                  TextFormField(

                    controller:
                        nameController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Event Name',
                      Icons.event,
                    ),

                    validator: (value) {

                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {

                        return "Please enter event name";
                      }

                      if (value
                              .trim()
                              .length <
                          3) {

                        return "Event name is too short";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  /// TAGLINE
                  TextFormField(

                    controller:
                        taglineController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Tagline',
                      Icons.description,
                    ),

                    validator: (value) {

                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {

                        return "Please enter event tagline";
                      }

                      if (value
                              .trim()
                              .length <
                          5) {

                        return "Tagline is too short";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION
                  TextFormField(

                    controller:
                        descriptionController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Description',
                      Icons.description,
                    ),

                    maxLines: 4,

                    validator: (value) {

                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {

                        return "Please enter event description";
                      }

                      if (value
                              .trim()
                              .length <
                          15) {

                        return "Description is too short";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  /// ORGANIZATION
                  header(
                    "Organizational Details",
                  ),

                  const SizedBox(height: 22),

                  /// COLLEGE
                  TextFormField(

                    controller:
                        collegeController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'College',
                      Icons.school,
                    ),

                    validator: (value) {

                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {

                        return "Please enter college name";
                      }

                      if (value
                              .trim()
                              .length <
                          3) {

                        return "College name is too short";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  /// DEPARTMENT
                  TextFormField(

                    controller:
                        departmentController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Department',
                      Icons.business,
                    ),

                    validator: (value) {

                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {

                        return "Please enter department name";
                      }

                      if (value
                              .trim()
                              .length <
                          2) {

                        return "Department name is too short";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  /// EVENT DETAILS
                  header("Event Details"),

                  const SizedBox(height: 22),

                  /// DATE
                  TextFormField(

                    controller:
                        dateController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    readOnly: true,

                    decoration: design(
                      'Date & Time',
                      Icons.calendar_today,
                    ),

                    validator: (value) {

                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {

                        return "Please select date and time";
                      }

                      return null;
                    },

                    onTap: () async {

                      FocusScope.of(context)
                          .unfocus();

                      DateTime? pickedDate =
                          await showDatePicker(

                        context: context,

                        initialDate:
                            DateTime.now(),

                        firstDate:
                            DateTime(2000),

                        lastDate:
                            DateTime(2101),
                      );

                      if (pickedDate ==
                          null) {
                        return;
                      }

                      if (!mounted) {
                        return;
                      }

                      TimeOfDay? pickedTime =
                          await showTimePicker(

                        context: context,

                        initialTime:
                            TimeOfDay.now(),
                      );

                      if (pickedTime ==
                          null) {
                        return;
                      }

                      setState(() {

                        dateController.text =
                            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')} "
                            "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  /// LOCATION
                  TextFormField(

                    controller:
                        locationController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Location',
                      Icons.location_on,
                    ),

                    validator: (value) {

                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {

                        return "Please enter location";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  /// REGISTRATION
                  header("Registration"),

                  const SizedBox(height: 22),

                  /// REGISTRATION INFO
                  TextFormField(

                    controller:
                        registrationInfoController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Registration Info',
                      Icons.info,
                    ),

                    maxLines: 4,

                    validator: (value) {

                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {

                        return "Please enter registration info";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  /// REGISTRATION LINK
                  TextFormField(

                    controller:
                        registrationLinkController,

                    style: const TextStyle(
                      color: Colors.white,
                    ),

                    decoration: design(
                      'Registration Link',
                      Icons.link,
                    ),

                    validator: (value) {

                      if (value == null ||
                          value
                              .trim()
                              .isEmpty) {

                        return "Please enter registration link";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 35),

                  /// BUTTONS
                  Row(

                    children: [

                      /// ADD BUTTON
                      Expanded(

                        child:
                            ElevatedButton(

                          style:
                              ElevatedButton
                                  .styleFrom(

                            backgroundColor:
                                const Color(
                              0xFF81D4FA,
                            ),

                            foregroundColor:
                                const Color
                                    .fromARGB(
                              255,
                              21,
                              0,
                              46,
                            ),

                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 16,
                            ),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          14),
                            ),
                          ),

                          onPressed: () {

                            FocusScope.of(context)
                                .unfocus();

                            final isValid =
                                _formkey
                                    .currentState!
                                    .validate();

                            if (!isValid) {
                              return;
                            }

                            final name =
                                nameController
                                    .text
                                    .trim();

                            final tagline =
                                taglineController
                                    .text
                                    .trim();

                            final description =
                                descriptionController
                                    .text
                                    .trim();

                            final college =
                                collegeController
                                    .text
                                    .trim();

                            final department =
                                departmentController
                                    .text
                                    .trim();

                            final location =
                                locationController
                                    .text
                                    .trim();

                            final registrationInfo =
                                registrationInfoController
                                    .text
                                    .trim();

                            final registrationLink =
                                registrationLinkController
                                    .text
                                    .trim();

                            /// EXTRA SAFETY CHECK
                            if (name.isEmpty ||
                                tagline.isEmpty ||
                                description.isEmpty ||
                                college.isEmpty ||
                                department.isEmpty) {

                              ScaffoldMessenger
                                      .of(context)
                                  .showSnackBar(

                                const SnackBar(
                                  content: Text(
                                    'Please fill all required fields',
                                  ),
                                ),
                              );

                              return;
                            }

                            MyData event =
                                MyData(

                              name: name,

                              tagline: tagline,

                              description:
                                  description,

                              college: college,

                              department:
                                  department,

                              location:
                                  location,

                              registrationInfo:
                                  registrationInfo,

                              registrationLink:
                                  registrationLink,

                              date:
                                  DateTime.parse(
                                dateController
                                    .text,
                              ),
                            );

                            widget.addEvent(
                              event,
                            );

                            ScaffoldMessenger
                                    .of(context)
                                .showSnackBar(

                              const SnackBar(
                                content: Text(
                                  'Event added successfully',
                                ),
                              ),
                            );

                            Navigator.pop(
                              context,
                            );
                          },

                          child: const Text(
                            'Add Event',

                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      /// RESET BUTTON
                      Expanded(

                        child:
                            ElevatedButton(

                          style:
                              ElevatedButton
                                  .styleFrom(

                            backgroundColor:
                                const Color
                                    .fromARGB(
                              255,
                              20,
                              30,
                              48,
                            ),

                            foregroundColor:
                                const Color(
                              0xFF81D4FA,
                            ),

                            side:
                                const BorderSide(
                              color: Color(
                                  0xFF81D4FA),
                            ),

                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 16,
                            ),

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                          14),
                            ),
                          ),

                          onPressed: () {

                            _formkey
                                .currentState!
                                .reset();

                            nameController
                                .clear();

                            taglineController
                                .clear();

                            descriptionController
                                .clear();

                            collegeController
                                .clear();

                            departmentController
                                .clear();

                            locationController
                                .clear();

                            registrationInfoController
                                .clear();

                            registrationLinkController
                                .clear();

                            dateController
                                .clear();
                          },

                          child: const Text(
                            'Reset',

                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
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