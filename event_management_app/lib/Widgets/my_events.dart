import 'package:flutter/material.dart';
import 'package:event_management_app/Widgets/home_screen.dart';
import 'package:event_management_app/Widgets/add_event.dart';
//import 'package:event_management_app/Widgets/home_screen.dart';
class MyData {
  String name="";
  late Image image;
  String tagline="";
  String description="";
  String college="";
  String department="";
  DateTime? date;
  TimeOfDay? time;
  String location="";
  String registrationInfo="";
  String contactInfo="";
  String registrationLink="";
  String eventType="";
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
    DateTime.parse('2024-06-01'),
    'Auditorium',
  ),
  MyData(
    'Event 2',
    'Description for Event 2',
    'College 2',
    'IT',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-02'),
    'Conference Room',
  ),
  MyData(
    'Event 3',
    'Description for Event 3',
    'College 3',
    'ME',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-03'),
    'Outdoor Stage',
  ),
  MyData(
    'Event 4',
    'Description for Event 4',
    'College 1',
    'IT',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-04'),
    'Main Hall',
  ),
  MyData(
    'Event 5',
    'Description for Event 5',
    'College 2',
    'CP',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-05'),
    'Lecture Theater',
  ),
  MyData(
    'Event 6',
    'Description for Event 6',
    'College 3',
    'CP',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-06'),
    'Exhibition Center',
  ),
];

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  List<MyData> events=[];
  void setData(List<MyData> data){
    setState(() {
      events=data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFF4F6FB),

      appBar: AppBar(
        title: const Text(
          'SyncUp',

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        backgroundColor: const Color.fromARGB(245, 39, 2, 88),

        elevation: 2,

        //leading: Image.asset('assets/logo2.png', width: 30, height: 30),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child:Navigator(
              initialRoute: '/',
              onGenerateRoute: (RouteSettings settings) {
                WidgetBuilder builder;
                switch (settings.name) {
                  case '/':
                  case '/home':
                    builder = (BuildContext _) => HomeScreen(myDataList: events,);
                    break;
                  case '/add-event':
                    builder = (BuildContext _) => AddEvent();
                    break;
                  default:
                    throw Exception('Invalid route: ${settings.name}');
                }
                return MaterialPageRoute(builder: builder, settings: settings);
              },
            )
          )
        ],
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
      ),
    );
  }
}