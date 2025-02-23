import 'package:flutter/material.dart';
import 'package:elearning_app/presentation/screens/home_screen.dart' as presentation;
import 'package:elearning_app/presentation/screens/explore_courses_screen.dart';
import 'package:elearning_app/presentation/screens/register_screen.dart';
import 'package:elearning_app/presentation/screens/login_screen.dart';
import 'package:elearning_app/presentation/screens/progress_tracking_screen.dart'; // Ensure this path is correct
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';


void main() {
  runApp(const ElearningApp());
}

class ElearningApp extends StatefulWidget {
  const ElearningApp({super.key});

  @override
  ElearningAppState createState() => ElearningAppState();
}

class ElearningAppState extends State<ElearningApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const presentation.HomeScreen(),
    const ExploreCoursesScreen(),
    ProgressTrackingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning App',
      theme: ThemeData(
        primaryColor: const Color(0xFF1E88E5),
        colorScheme: ColorScheme.light(
          secondary: Colors.blueAccent,
        ),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          selectedItemColor: const Color(0xFF1E88E5),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Progress',
            ),
          ],
        ),
      ),
    );
  }
}