import 'package:flutter/material.dart';
import 'package:event_management_app/Widgets/home_screen.dart';
import 'package:event_management_app/Widgets/add_event.dart';
import 'package:event_management_app/Widgets/event_details.dart';
//import 'package:event_management_app/Widgets/home_screen.dart';
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
    this.description,
    this.college,
    this.department,
    this.image,
    this.date,
    this.location,
    this.registrationInfo,
    this.tagline,
    this.registrationLink,
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
    'Register at example.com',
    'This is a tagline for Event 1',
    'https://example.com/register-event-1',

  ),
  MyData(
    'Event 2',
    'Description for Event 2',
    'College 2',
    'IT',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-02'),
    'Conference Room',
    'Register at example.com',
    'This is a tagline for Event 2', 
    'https://example.com/register-event-2', 
  ),
  MyData(
    'Event 3',
    'Description for Event 3',
    'College 3',
    'ME',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-03'),
    'Outdoor Stage',
    'Register at example.com',
    'This is a tagline for Event 3',
    'https://example.com/register-event-3',
  ),
  MyData(
    'Event 4',
    'Description for Event 4',
    'College 1',
    'IT',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-04'),
    'Main Hall',
    'Register at example.com',
    'This is a tagline for Event 4',
    'https://example.com/register-event-4',
  ),
  MyData(
    'Event 5',
    'Description for Event 5',
    'College 2',
    'CP',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-05'),
    'Lecture Theater',
    'Register at example.com',
    'This is a tagline for Event 5',
    'https://example.com/register-event-5',
  ),
  MyData(
    'Event 6',
    'Description for Event 6',
    'College 3',
    'CP',
    Image.asset('assets/placeholder.png'),
    DateTime.parse('2024-06-06'),
    'Exhibition Center',
    'Register at example.com',
    'This is a tagline for Event 6',
    'https://example.com/register-event-6',
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
        leading: Image.asset('assets/logo2.png', width: 25, height: 25),

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
                  case '/event-details':
                    final myData = settings.arguments as MyData;
                    builder = (BuildContext _) => EventDetails(myData: myData);
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