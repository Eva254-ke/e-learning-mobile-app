import 'package:flutter/material.dart';

class ExploreCoursesScreen extends StatelessWidget {
  // Dummy list of software engineering courses
  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Introduction to Programming',
      'description': 'Learn the basics of programming with Python.',
      'price': '\$49.99',
      'videoUrl': 'https://www.youtube.com/watch?v=bJzb-RuUcMU', // Placeholder URL
    },
    {
      'title': 'Data Structures and Algorithms',
      'description': 'Master the fundamentals of data structures and algorithms.',
      'price': '\$79.99',
      'videoUrl': 'https://www.youtube.com/watch?v=iZmDcfTtcNg', // Placeholder URL
    },
    {
      'title': 'Web Development Bootcamp',
      'description': 'Build modern web applications with HTML, CSS, and JavaScript.',
      'price': '\$99.99',
      'videoUrl': 'https://www.youtube.com/watch?v=FazgJVnrVuI', // Placeholder URL
    },
    {
      'title': 'Mobile App Development with Flutter',
      'description': 'Create cross-platform mobile apps using Flutter and Dart.',
      'price': '\$129.99',
      'videoUrl': 'https://www.youtube.com/watch?v=I9ceqw5Ny-4&list=PLSzsOkUDsvdtl3Pw48-R8lcK2oYkk40cm', // Placeholder URL
    },
    {
      'title': 'Machine Learning Fundamentals',
      'description': 'Explore the basics of machine learning and AI.',
      'price': '\$149.99',
      'videoUrl': 'https://www.youtube.com/watch?v=ukzFI9rgwfU', // Placeholder URL
    },
  ];

  ExploreCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Courses', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course['description'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        course['price'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Navigate to a video player screen (placeholder)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Playing: ${course['title']}'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Watch Video',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () {
                          // Handle enrollment logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Enrolled in: ${course['title']}'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Enroll',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}