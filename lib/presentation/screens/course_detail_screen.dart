import 'package:flutter/material.dart';
import '../../data/models/course.dart';
import 'quiz_screen.dart';

// ignore: use_key_in_widget_constructors
class CourseDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Retrieve the course object passed as an argument
    final Course course = ModalRoute.of(context)!.settings.arguments as Course;

    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                course.thumbnailUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),

            // Course Description
            Text(
              course.description,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Start Quiz Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/quiz',
                    arguments: course, // Pass the course object
                  );
                },
                child: Text('Start Quiz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}