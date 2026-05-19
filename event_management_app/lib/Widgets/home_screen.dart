import 'package:event_management_app/Widgets/simple_card_widget.dart';
import 'package:flutter/material.dart';

class MyData {
  final String name;
  final String description;
  final String college;
  final String department;
  final Image image;
  final String date;
  final String location;

  MyData(
    this.name,
    this.description,
    this.college,
    this.department,
    this.image,
    this.date,
    this.location,
  );
}

final List<MyData> myDataList = [
  MyData(
    'Event 1',
    'Description for Event 1',
    'College 1',
    'CP',
    Image.asset('assets/placeholder.png'),
    '2024-06-01',
    'Auditorium',
  ),
  MyData(
    'Event 2',
    'Description for Event 2',
    'College 2',
    'IT',
    Image.asset('assets/placeholder.png'),
    '2024-06-02',
    'Conference Room',
  ),
  MyData(
    'Event 3',
    'Description for Event 3',
    'College 3',
    'ME',
    Image.asset('assets/placeholder.png'),
    '2024-06-03',
    'Outdoor Stage',
  ),
  MyData(
    'Event 4',
    'Description for Event 4',
    'College 1',
    'IT',
    Image.asset('assets/placeholder.png'),
    '2024-06-04',
    'Main Hall',
  ),
  MyData(
    'Event 5',
    'Description for Event 5',
    'College 2',
    'CP',
    Image.asset('assets/placeholder.png'),
    '2024-06-05',
    'Lecture Theater',
  ),
  MyData(
    'Event 6',
    'Description for Event 6',
    'College 3',
    'CP',
    Image.asset('assets/placeholder.png'),
    '2024-06-06',
    'Exhibition Center',
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
      backgroundColor: const Color(0xFFF4F6FB),

      appBar: AppBar(
        title: const Text(
          'Event Management App',

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        backgroundColor: const Color.fromARGB(245, 39, 2, 88),

        elevation: 2,

        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),

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

                  return SimpleCardWidget(
                    title: e.name,
                    description: e.description,
                    image: e.image,
                    college: e.college,
                    department: e.department,
                    date: '2024-06-01',
                    location: 'Auditorium',
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(255, 39, 2, 88),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }


}
