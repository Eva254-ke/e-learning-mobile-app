
import 'package:flutter/material.dart';

class Course {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String duration;
  final String instructor;
  final double price;
  final List<String> topics;
  final double rating;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.duration,
    required this.instructor,
    required this.price,
    required this.topics,
    required this.rating,
  });
}

class ExploreCoursesScreen extends StatefulWidget {
  const ExploreCoursesScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExploreCoursesScreenState createState() => _ExploreCoursesScreenState();
}

class _ExploreCoursesScreenState extends State<ExploreCoursesScreen> {
  final List<Course> _courses = [
    Course(
      id: '1',
      title: 'Flutter & Dart: Complete Mobile Development',
      description: 'Master Flutter and build iOS and Android apps with a single codebase. Includes state management, Firebase, and REST APIs.',
      price: 89.99,
      thumbnailUrl: 'https://picsum.photos/300/200?random=1',
      duration: '42 hours',
      instructor: 'Sarah Johnson',
      topics: ['Flutter', 'Dart', 'Mobile Development', 'Firebase', 'REST APIs'],
      rating: 4.8,
    ),
    Course(
      id: '2',
      title: 'Full Stack JavaScript Development',
      description: 'Learn modern JavaScript, Node.js, React, and MongoDB to become a full-stack developer. Build real-world projects.',
      price: 99.99,
      thumbnailUrl: 'https://picsum.photos/300/200?random=2',
      duration: '56 hours',
      instructor: 'Michael Chen',
      topics: ['JavaScript', 'Node.js', 'React', 'MongoDB', 'Express'],
      rating: 4.9,
    ),
    Course(
      id: '3',
      title: 'Python for Data Science & ML',
      description: 'Comprehensive course covering Python, NumPy, Pandas, Scikit-Learn, and TensorFlow for data science and ML applications.',
      price: 129.99,
      thumbnailUrl: 'https://picsum.photos/300/200?random=3',
      duration: '48 hours',
      instructor: 'Dr. Emily Williams',
      topics: ['Python', 'Data Science', 'Machine Learning', 'NumPy', 'Pandas'],
      rating: 4.7,
    ),
    Course(
      id: '4',
      title: 'AWS Certified Solutions Architect',
      description: 'Prepare for the AWS Solutions Architect certification with hands-on labs and real-world scenarios.',
      price: 149.99,
      thumbnailUrl: 'https://picsum.photos/300/200?random=4',
      duration: '32 hours',
      instructor: 'David Miller',
      topics: ['AWS', 'Cloud Computing', 'DevOps', 'Security', 'Networking'],
      rating: 4.8,
    ),
    Course(
      id: '5',
      title: 'Blockchain Development with Solidity',
      description: 'Learn to build decentralized applications (DApps) on Ethereum using Solidity, Web3.js, and Truffle.',
      price: 119.99,
      thumbnailUrl: 'https://picsum.photos/300/200?random=5',
      duration: '36 hours',
      instructor: 'Alex Thompson',
      topics: ['Blockchain', 'Solidity', 'Ethereum', 'Smart Contracts', 'DApps'],
      rating: 4.6,
    ),
    Course(
      id: '6',
      title: 'UI/UX Design Masterclass',
      description: 'Master modern UI/UX design principles using Figma, Adobe XD, and learn design thinking methodology.',
      price: 79.99,
      thumbnailUrl: 'https://picsum.photos/300/200?random=6',
      duration: '38 hours',
      instructor: 'Lisa Anderson',
      topics: ['UI Design', 'UX Design', 'Figma', 'Adobe XD', 'Prototyping'],
      rating: 4.9,
    ),
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Courses'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search courses...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                final course = _courses[index];
                if (_searchQuery.isEmpty ||
                    course.title.toLowerCase().contains(_searchQuery.toLowerCase())) {
                  return CourseCard(course: course);
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({
    super.key,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to course detail screen
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                course.thumbnailUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: Colors.grey[300],
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: course.topics.map((topic) => Chip(
                      label: Text(
                        topic,
                        style: const TextStyle(fontSize: 12),
                      ),
                      backgroundColor: Colors.blue[50],
                    )).toList(),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            course.duration,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            size: 16,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            course.rating.toString(),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${course.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Add enrollment logic here
                        },
                        child: const Text('Enroll Now'),
                      ),
                    ],
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
