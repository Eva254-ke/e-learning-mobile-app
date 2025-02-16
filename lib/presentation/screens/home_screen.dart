import 'package:flutter/material.dart';
import 'explore_courses_screen.dart'; // Import the ExploreCoursesScreen

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SmartLearn'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add search functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tagline
            Text(
              'Software engineering concepts from the world\'s best universities in your pocket.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for courses...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Link to Explore Courses Screen
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExploreCoursesScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text('Explore Courses'),
              ),
            ),
            SizedBox(height: 20),

            // Buttons for Register, Sign In, and Guest Mode
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Register Screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text('Register'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Sign In Screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: Text('Sign In'),
                  ),
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Continue in Guest Mode
                    },
                    child: Text('Continue as Guest'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExploreCoursesScreen extends StatelessWidget {
  const ExploreCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Courses'),
      ),
      body: Center(
        child: Text('Explore Courses Content Here'),
      ),
    );
  }
}