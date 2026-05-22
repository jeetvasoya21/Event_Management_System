import 'dart:convert';
import 'package:event_management_app/Widgets/edit_event.dart';
import 'package:event_management_app/Widgets/event_details.dart';
import 'package:flutter/material.dart';
import 'package:event_management_app/Widgets/home_screen.dart';
import 'package:event_management_app/Widgets/add_event.dart';
import 'package:event_management_app/Widgets/event_class.dart';
import 'package:event_management_app/Widgets/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyEvents extends StatefulWidget {
  

  

  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  Future<void> loadInfo() async {
    try{
      final sharedPreferences = await SharedPreferences.getInstance();
      String? jsonString = sharedPreferences.getString('myDataList');
      if(jsonString != null){
        List<dynamic> jsonList = jsonDecode(jsonString);
        setState(() {
          myDataList = jsonList.map((json) => MyData.fromJson(json)).toList();
        });
      }
    }
    catch(e){
      print('Error loading data: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    loadInfo();
  }

  List<MyData> myDataList = [
    // MyData(
    //   name: 'Event 1',
    //   tagline: 'Tagline for Event 1',
    //   college: 'College 1',
    //   department: 'CP',
    //   date: DateTime.parse('2024-06-01'),
    //   location: 'Auditorium',
    //   registrationInfo: 'Register at example.com',
    //   description: 'This is a tagline for Event 1',
    //   registrationLink: 'https://example.com/register-event-1',
    // ),
    // MyData(
    //   name: 'Event 2',
    //   tagline: 'Tagline for Event 2',
    //   college: 'College 2',
    //   department: 'IT',
    //   date: DateTime.parse('2024-06-02'),
    //   location: 'Conference Room',
    //   registrationInfo: 'Register at example.com',
    //   description: 'This is a tagline for Event 2',
    //   registrationLink: 'https://example.com/register-event-2',
    // ),
    // MyData(
    //   name: 'Event 3',
    //   tagline: 'Tagline for Event 3',
    //   college: 'College 3',
    //   department: 'ME',
    //   date: DateTime.parse('2024-06-03'),
    //   location: 'Outdoor Stage',
    //   registrationInfo: 'Register at example.com',
    //   description: 'This is a tagline for Event 3',
    //   registrationLink: 'https://example.com/register-event-3',
    // ),
    // MyData(
    //   name: 'Event 4',
    //   tagline: 'Tagline for Event 4',
    //   college: 'College 1',
    //   department: 'IT',
    //   date: DateTime.parse('2024-06-04'),
    //   location: 'Main Hall',
    //   registrationInfo: 'Register at example.com',
    //   description: 'This is a tagline for Event 4',
    //   registrationLink: 'https://example.com/register-event-4',
    // ),
    // MyData(
    //   name: 'Event 5',
    //   tagline: 'Tagline for Event 5',
    //   college: 'College 2',
    //   department: 'CP',
    //   date: DateTime.parse('2024-06-05'),
    //   location: 'Lecture Theater',
    //   registrationInfo: 'Register at example.com',
    //   description: 'This is a tagline for Event 5',
    //   registrationLink: 'https://example.com/register-event-5',
    // ),
    // MyData(
    //   name: 'Event 6',
    //   tagline: 'Tagline for Event 6',
    //   college: 'College 3',
    //   department: 'CP',
    //   //image: Image.asset('assets/placeholder.png'),
    //   date: DateTime.parse('2024-06-06'),
    //   location: 'Exhibition Center',
    //   registrationInfo: 'Register at example.com',
    //   description: 'This is a tagline for Event 6',
    //   registrationLink: 'https://example.com/register-event-6',
    // ),
  ];
  
  Future<void> saveInfo() async {
    try{
      final sharedPreferences = await SharedPreferences.getInstance();
      String jsonString = jsonEncode(myDataList.map((event) => event.toJson()).toList());
      await sharedPreferences.setString('myDataList', jsonString);
      
    }
    catch(e){
      print('Error saving data: $e');
    }
  }
  
  void addEvent(MyData event) {
    setState(() {
      myDataList.add(event);
    });
      saveInfo();
  }
  void removeEvent(MyData event){
    setState(() {
      myDataList.remove(event);
    });
      saveInfo();
  }

  int _currentIndex = 0;

  void editEvent(int index, MyData updatedEvent) {
    setState(() {
      myDataList[index] = updatedEvent;
    });
      saveInfo();
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

        //leading: Image.asset('assets/logo2.png', width: 30, height: 30),
        leading: Image.asset('assets/Logo2.png', width: 25, height: 25),

      ),
      body: _currentIndex == 0
          ? Column(
              children: [
                Expanded(
                  child: Navigator(
                    initialRoute: '/',
                    onGenerateRoute: (RouteSettings settings) {
                      WidgetBuilder builder;
                      switch (settings.name) {
                        case '/':
                        case '/home':
                          builder = (BuildContext _) => HomeScreen(myDataList: myDataList,);
                          break;
                        case '/add-event':
                          builder = (BuildContext _) => AddEvent(addEvent: addEvent,);
                          break;
                        case '/event-details':
                          final args = settings.arguments as Map<String, dynamic>;
                          final myData = args['event'] as MyData;
                          final index = args['index'] as int;
                          builder = (BuildContext _) => EventDetails(
                            myData: myData,
                            index: index,
                            removeEvent: removeEvent,
                          );
                          break;
                        case '/edit-event':
                          final args = settings.arguments as Map<String, dynamic>;
                          final myData = args['event'] as MyData;
                          final index = args['index'] as int;
                          builder = (BuildContext _) => EditEvent(
                            event: myData,
                            editEvent: (updatedEvent) => editEvent(index, updatedEvent),
                          );
                          break;
                        default:
                          throw Exception('Invalid route: ${settings.name}');
                      }
                      return MaterialPageRoute(builder: builder, settings: settings);
                    },
                  ),
                )
              ],
            )
          : _currentIndex == 1
              ? Center(
                  child: Text(
                    'Wishlist coming soon',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                )
              : const UserProfile(),
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
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      ),
    );
  }
}
