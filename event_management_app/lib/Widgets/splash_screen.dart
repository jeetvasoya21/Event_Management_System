import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [const Color.fromARGB(216, 184, 234, 237), const Color.fromARGB(255, 14, 116, 119)],
            )
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '1.1.1',
                    style: TextStyle(
                      fontSize: 17, 
                      //fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 36, 148, 163)

                      ),
                  )
                ],
              ),
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Image.asset(
                    'assets/Logo1.png',
                    width: 300,
                    height: 300,
                  ),
                ],
              ),
              //const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Event Management System',
                    style: TextStyle(
                      fontSize: 24, 
                      //fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 157, 230, 240),
                      fontFamily: 'sans-serif',
                      ),
                  )
                ],
              ),
              const SizedBox(height: 80),
              const CircularProgressIndicator(color: Color.fromARGB(255, 117, 190, 194),),
              const SizedBox(height: 20),
              const Text(
                '   Loading...',
                style: TextStyle(
                  fontSize: 18, 
                  //fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 117, 190, 194),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}