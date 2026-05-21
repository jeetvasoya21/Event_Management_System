import 'package:event_management_app/Widgets/simple_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:event_management_app/Widgets/event_class.dart';

class HomeScreen extends StatefulWidget {
  final List<MyData> myDataList;

  const HomeScreen({super.key, required this.myDataList});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedCollege = 'All';
  var selectedDepartment = 'All';

  List<MyData> get newDataList {
    return widget.myDataList.where((data) {
      final newselectedCollege =
          selectedCollege == 'All' || data.college == selectedCollege;

      final newSelectedDepartment =
          selectedDepartment == 'All' || data.department == selectedDepartment;

      return newselectedCollege && newSelectedDepartment;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List<String> colleges = [
      'All',
      ...widget.myDataList.map((data) => data.college).toSet(),
    ];

    List<String> departments = [
      'All',
      ...widget.myDataList.map((data) => data.department).toSet(),
    ];

    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 1;

    if (screenWidth > 1200) {
      crossAxisCount = 4;
    } else if (screenWidth > 900) {
      crossAxisCount = 3;
    } else if (screenWidth > 600) {
      crossAxisCount = 2;
    }

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

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              /// FILTERS
              Row(
                children: [
                  /// COLLEGE DROPDOWN
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 20, 30, 48),

                        borderRadius: BorderRadius.circular(14),

                        border: Border.all(
                          color: const Color(
                            0xFF81D4FA,
                          ).withAlpha((0.25 * 255).round()),
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.25 * 255).round()),

                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8),

                        child: DropdownButtonFormField<String>(
                          isExpanded: true,

                          dropdownColor: const Color.fromARGB(255, 20, 30, 48),

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),

                          iconEnabledColor: const Color(0xFF81D4FA),

                          decoration: InputDecoration(
                            labelText: 'Select College',

                            labelStyle: const TextStyle(
                              color: Color(0xFF81D4FA),
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),

                              borderSide: BorderSide(
                                color: Colors.white.withAlpha(
                                  (0.15 * 255).round(),
                                ),
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),

                              borderSide: const BorderSide(
                                color: Color(0xFF81D4FA),
                                width: 2,
                              ),
                            ),
                          ),

                          items: colleges.map((college) {
                            return DropdownMenuItem<String>(
                              value: college,

                              child: Text(
                                college,

                                maxLines: 1,

                                overflow: TextOverflow.ellipsis,

                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),

                          initialValue: 'All',

                          onChanged: (value) {
                            setState(() {
                              selectedCollege = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  /// DEPARTMENT DROPDOWN
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 20, 30, 48),

                        borderRadius: BorderRadius.circular(14),

                        border: Border.all(
                          color: const Color(
                            0xFF81D4FA,
                          ).withAlpha((0.25 * 255).round()),
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha((0.25 * 255).round()),

                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8),

                        child: DropdownButtonFormField<String>(
                          isExpanded: true,

                          dropdownColor: const Color.fromARGB(255, 20, 30, 48),

                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),

                          iconEnabledColor: const Color(0xFF81D4FA),

                          decoration: InputDecoration(
                            labelText: 'Select Department',

                            labelStyle: const TextStyle(
                              color: Color(0xFF81D4FA),
                            ),

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),

                              borderSide: BorderSide(
                                color: Colors.white.withAlpha(
                                  (0.15 * 255).round(),
                                ),
                              ),
                            ),

                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),

                              borderSide: const BorderSide(
                                color: Color(0xFF81D4FA),
                                width: 2,
                              ),
                            ),
                          ),

                          items: departments.map((department) {
                            return DropdownMenuItem<String>(
                              value: department,

                              child: Text(
                                department,

                                maxLines: 1,

                                overflow: TextOverflow.ellipsis,

                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),

                          initialValue: 'All',

                          onChanged: (value) {
                            setState(() {
                              selectedDepartment = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// GRIDVIEW
              Expanded(
                child: GridView.builder(
                  itemCount: newDataList.length,

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,

                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,

                    childAspectRatio: screenWidth > 1200
                        ? 1.02
                        : screenWidth > 900
                        ? 0.96
                        : screenWidth > 600
                        ? 0.88
                        : 0.84,
                  ),

                  itemBuilder: (context, index) {
                    final e = newDataList[index];

                    final originalIndex = widget.myDataList.indexOf(e);

                    return InkWell(
                      borderRadius: BorderRadius.circular(18),

                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/event-details',

                          arguments: {
                            'index': originalIndex,

                            'event': widget.myDataList[originalIndex],
                          },
                        );
                      },

                      child: SimpleCardWidget(e: e),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add-event');

          setState(() {});
        },

        backgroundColor: const Color(0xFF81D4FA),

        child: const Icon(Icons.add, color: Color.fromARGB(255, 21, 0, 46)),
      ),
    );
  }
}
