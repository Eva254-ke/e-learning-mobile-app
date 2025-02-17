import 'package:elearning_app/presentation/screens/home_screen.dart' as presentation;
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/explore_courses_screen.dart';
import 'screens/progress_tracking_screen.dart';

void main() {
  runApp(ElearningApp());
}

class ElearningApp extends StatefulWidget {
  const ElearningApp({super.key});

  @override
  ElearningAppState createState() => ElearningAppState();
}

class ElearningAppState extends State<ElearningApp> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    presentation.HomeScreen(),
    ExploreCoursesScreen(),
    ProgressTrackingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning App',
      theme: ThemeData(
        primaryColor: Color(0xFF1E88E5),
        colorScheme: ColorScheme.light(
          secondary: Colors.blueAccent,
        ),
        fontFamily: 'Roboto',
        appBarTheme: AppBarTheme(
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
          selectedItemColor: Color(0xFF1E88E5),
          unselectedItemColor: Colors.grey,
          items: [
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

class ProgressTrackingScreen extends StatelessWidget {
  const ProgressTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress Tracking'),
      ),
      body: Center(
        child: Text('Progress Tracking Screen'),
      ),
    );
  }
}