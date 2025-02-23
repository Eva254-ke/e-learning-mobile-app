import 'package:flutter/material.dart';
import 'package:elearning_app/presentation/screens/home_screen.dart'; // HomeScreen
import 'package:elearning_app/presentation/screens/explore_courses_screen.dart'; // ExploreCoursesScreen
import 'package:elearning_app/presentation/screens/register_screen.dart'; // RegisterScreen
import 'package:elearning_app/presentation/screens/login_screen.dart'; // LoginScreen
import 'package:elearning_app/presentation/screens/progress_tracking_screen.dart'; // ProgressTrackingScreen
import 'package:elearning_app/presentation/screens/course_video_screen.dart'; // CourseVideoScreen
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Firebase configuration

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ElearningApp());
}

class ElearningApp extends StatefulWidget {
  const ElearningApp({super.key});

  @override
  ElearningAppState createState() => ElearningAppState();
}

class ElearningAppState extends State<ElearningApp> {
  int _currentIndex = 0; // Index for the selected screen in the BottomNavigationBar

  // List of screens for the BottomNavigationBar
  final List<Widget> _screens = [
    const HomeScreen(), // Home Screen
    ExploreCoursesScreen(), // Explore Courses Screen
    const ProgressTrackingScreen(), // Progress Tracking Screen
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning App',
      theme: ThemeData(
        primaryColor: const Color(0xFF1E88E5), // Primary color
        colorScheme: ColorScheme.light(
          secondary: Colors.blueAccent, // Accent color
        ),
        fontFamily: 'Roboto', // Default font
        appBarTheme: const AppBarTheme(
          color: Colors.white, // AppBar background color
          iconTheme: IconThemeData(color: Colors.black), // AppBar icons color
          titleTextStyle: TextStyle(
            color: Colors.black, // AppBar title color
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // Home is a Scaffold with a BottomNavigationBar
      home: Scaffold(
        body: _screens[_currentIndex], // Display the selected screen
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex, // Current selected index
          onTap: (index) => setState(() => _currentIndex = index), // Update index on tap
          selectedItemColor: const Color(0xFF1E88E5), // Selected item color
          unselectedItemColor: Colors.grey, // Unselected item color
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Home icon
              label: 'Home', // Home label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore), // Explore icon
              label: 'Explore', // Explore label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment), // Progress icon
              label: 'Progress', // Progress label
            ),
          ],
        ),
      ),
      // Define routes for navigation
      routes: {
        '/home': (context) => const HomeScreen(),
        '/explore': (context) => ExploreCoursesScreen(),
        '/progress': (context) => const ProgressTrackingScreen(),
        '/register': (context) => const RegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/video': (context) {
          final videoUrl = ModalRoute.of(context)!.settings.arguments as String;
          return CourseVideoScreen(videoUrl: videoUrl, courseTitle: '',);
        },
      },
    );
  }
}