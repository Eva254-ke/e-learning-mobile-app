import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/models/course.dart';
import '../../providers/course_provider.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Progress'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: courseProvider.courses.length,
        itemBuilder: (context, index) {
          final course = courseProvider.courses[index];
          return ListTile(
            title: Text(course.title),
            subtitle: LinearProgressIndicator(
              value: 0.5, // Replace with actual progress
            ),
          );
        },
      ),
    );
  }
}