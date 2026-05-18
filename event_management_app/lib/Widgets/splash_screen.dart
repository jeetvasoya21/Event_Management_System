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
              colors: [ const Color.fromARGB(255, 1, 36, 57),const Color.fromARGB(228, 21, 0, 46),],
            )
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'v1.0',
                    style: TextStyle(
                      fontSize: 17, 
                      //fontWeight: FontWeight.bold,
                      color: Color(0xFF81D4FA)

                      ),
                  )
                ],
              ),
              const SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Image.asset(
                    'assets/Logo2.png',
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
                    'SyncUp',
                    style: TextStyle(
                      fontSize: 24, 
                      //fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 205, 249, 254),
                      fontFamily: 'Inter',
                      ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'From Seminars to Celebration',
                    style: TextStyle(
                      fontSize: 18, 
                      //fontWeight: FontWeight.bold,
                      color: Color(0xFF81D4FA),
                      fontFamily: 'Inter',
                      ),
                  )
                ],
              ),
              const SizedBox(height: 80),
              const CircularProgressIndicator(color: Color(0xFF81D4FA),),
              const SizedBox(height: 20),
              const Text(
                '   Loading...',
                style: TextStyle(
                  fontSize: 18, 
                  //fontWeight: FontWeight.bold,
                  color: Color(0xFF81D4FA),
                  fontFamily: 'Inter',
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}