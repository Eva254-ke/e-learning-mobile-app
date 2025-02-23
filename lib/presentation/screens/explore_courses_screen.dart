import 'package:flutter/material.dart';
import 'course_video_screen.dart'; // Import the new video player screen

class ExploreCoursesScreen extends StatelessWidget {
  // Dummy list of software engineering courses with additional features
  final List<Map<String, dynamic>> courses = [
    {
      'title': 'Introduction to Programming',
      'description': 'Learn the basics of programming with Python.',
      'price': '\$49.99',
      'videoUrl': 'https://www.youtube.com/watch?v=bJzb-RuUcMU',
      'enrolledStudents': 1200,
      'rating': 4.7,
      'duration': '6 hours',
    },
    {
      'title': 'Data Structures and Algorithms',
      'description': 'Master the fundamentals of data structures and algorithms.',
      'price': '\$79.99',
      'videoUrl': 'https://www.youtube.com/watch?v=iZmDcfTtcNg',
      'enrolledStudents': 2500,
      'rating': 4.8,
      'duration': '10 hours',
    },
    {
      'title': 'Web Development Bootcamp',
      'description': 'Build modern web applications with HTML, CSS, and JavaScript.',
      'price': '\$99.99',
      'videoUrl': 'https://www.youtube.com/watch?v=FazgJVnrVuI',
      'enrolledStudents': 3500,
      'rating': 4.9,
      'duration': '15 hours',
    },
    {
      'title': 'Mobile App Development with Flutter',
      'description': 'Create cross-platform mobile apps using Flutter and Dart.',
      'price': '\$129.99',
      'videoUrl': 'https://www.youtube.com/watch?v=I9ceqw5Ny-4&list=PLSzsOkUDsvdtl3Pw48-R8lcK2oYkk40cm',
      'enrolledStudents': 1800,
      'rating': 4.6,
      'duration': '12 hours',
    },
    {
      'title': 'Machine Learning Fundamentals',
      'description': 'Explore the basics of machine learning and AI.',
      'price': '\$149.99',
      'videoUrl': 'https://www.youtube.com/watch?v=ukzFI9rgwfU',
      'enrolledStudents': 3000,
      'rating': 4.5,
      'duration': '8 hours',
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
                  const SizedBox(height: 12),
                  // Additional course details
                  Row(
                    children: [
                      _buildCourseDetail(Icons.people, '${course['enrolledStudents']} Students'),
                      const SizedBox(width: 16),
                      _buildCourseDetail(Icons.star, '${course['rating']}'),
                      const SizedBox(width: 16),
                      _buildCourseDetail(Icons.timer, course['duration']),
                    ],
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
                          // Navigate to the CourseVideoScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseVideoScreen(
                                videoUrl: course['videoUrl'],
                                courseTitle: course['title'],
                              ),
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

  // Helper method to build course details
  Widget _buildCourseDetail(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}