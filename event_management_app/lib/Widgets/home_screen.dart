import 'package:event_management_app/Widgets/simple_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:event_management_app/Widgets/my_events.dart';



class HomeScreen extends StatefulWidget {

  List<MyData> myDataList = [];

  HomeScreen({
    super.key,
    required this.myDataList,
    });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> colleges = ['All', 'College 1', 'College 2', 'College 3'];

  List<String> departments = ['All', 'CP', 'IT', 'ME'];

  var selectedCollege = 'All';
  var selectedDepartment = 'All';

  List<MyData> get newDataList {
    return myDataList.where((data) {
      final newselectedCollege =
          selectedCollege == 'All' || data.college == selectedCollege;

      final newSelectedDepartment =
          selectedDepartment == 'All' || data.department == selectedDepartment;

      return newselectedCollege && newSelectedDepartment;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
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

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            /// FILTERS
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Select College',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 9, 203, 190),
                              width: 2,
                            ),
                          ),
                        ),
                        items: colleges
                            .map(
                              (college) => DropdownMenuItem<String>(
                                value: college,
                                child: Text(college),
                              ),
                            )
                            .toList(),
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

                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Select Department',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: const Color.fromARGB(255, 9, 203, 190),
                              width: 2,
                            ),
                          ),
                        ),
                        items: departments
                            .map(
                              (department) => DropdownMenuItem<String>(
                                value: department,
                                child: Text(department),
                              ),
                            )
                            .toList(),
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

                  childAspectRatio: 1.15,
                ),

                itemBuilder: (context, index) {
                  final e = newDataList[index];

                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/event-details',
                        arguments: e,
                      );
                    },
                 child: SimpleCardWidget(
                    title: e.name,
                    description: e.description,
                    image: e.image,
                    college: e.college,
                    department: e.department,
                    date: e.date,
                    location: e.location,
                  
                  ),
                  );
                  
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/add-event'),
        backgroundColor: const Color.fromARGB(255, 39, 2, 88),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }


}
