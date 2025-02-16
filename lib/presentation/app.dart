import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../widgets/course_card.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('E-Learning App'),
        ),
        body: Consumer<CourseProvider>(
          builder: (context, courseProvider, _) {
            if (courseProvider.courses.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: courseProvider.courses.length,
              itemBuilder: (context, index) {
                return CourseCard(course: courseProvider.courses[index], onTap: () {  }, title: '', thumbnailUrl: '', description: '',);
              },
            );
          },
        ),
      ),
    );
  }
}
