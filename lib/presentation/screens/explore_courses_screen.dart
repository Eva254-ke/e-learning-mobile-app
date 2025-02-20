import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class Course {
  final String id;
  final String title;
  final String description;
  final String price;
  final String videoUrl;
  final String thumbnailUrl;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.videoUrl,
    required this.thumbnailUrl,
  });
}

class ExploreCoursesScreen extends StatefulWidget {
  const ExploreCoursesScreen({super.key});

  @override
  State<ExploreCoursesScreen> createState() => _ExploreCoursesScreenState();
}

class _ExploreCoursesScreenState extends State<ExploreCoursesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _selectedSort = 'Most Popular';

  final List<Course> _courses = [
    Course(
      id: '1',
      title: 'Java Programming and Software Engineering Fundamentals',
      description: 'Learn Java and software engineering principles.',
      price: '\$16.99',
      videoUrl: 'https://www.coursera.org/learn/java-programming',
      thumbnailUrl: 'https://example.com/thumbnail1.jpg',
    ),
    Course(
      id: '2',
      title: 'Introduction to Software Engineering',
      description: 'Understand the software development life cycle.',
      price: '\$0 (Free)',
      videoUrl: 'https://www.coursera.org/learn/introduction-to-software-engineering',
      thumbnailUrl: 'https://example.com/thumbnail2.jpg',
    ),
    Course(
      id: '3',
      title: 'Software Engineering Bootcamp',
      description: 'Full stack development and software engineering skills.',
      price: 'Ksh 174,000',
      videoUrl: 'https://moringaschool.com/courses/software-engineering-full-stack-web-development/',
      thumbnailUrl: 'https://example.com/thumbnail3.jpg',
    ),
    Course(
      id: '4',
      title: 'Software Engineering Online Courses',
      description: 'Various courses on software engineering topics.',
      price: '\$16.99 - \$109.99',
      videoUrl: 'https://www.udemy.com/courses/development/software-engineering/',
      thumbnailUrl: 'https://example.com/thumbnail4.jpg',
    ),
    Course(
      id: '5',
      title: 'OTHM Level 7 Diploma in Immersive Software Engineering',
      description: 'Advanced knowledge in immersive software systems.',
      price: 'Contact for pricing',
      videoUrl: 'https://www.reed.co.uk/courses/software-engineering/online',
      thumbnailUrl: 'https://example.com/thumbnail5.jpg',
    ),
  ];

  final List<String> _categories = [
    'All',
    'Programming',
    'Design',
    'Business',
    'Marketing',
    'Data Science',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search courses...',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: (value) => _filterCourses(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: _selectedSort,
              items: const [
                DropdownMenuItem(value: 'Most Popular', child: Text('Most Popular')),
                DropdownMenuItem(value: 'Newest', child: Text('Newest')),
                DropdownMenuItem(value: 'Highest Rated', child: Text('Highest Rated')),
              ],
              onChanged: (value) => setState(() => _selectedSort = value!),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(_categories[index]),
                    selected: _selectedCategory == _categories[index],
                    onSelected: (selected) => setState(() => _selectedCategory = _categories[index]),
                    selectedColor: const Color(0xFF1E88E5),
                    labelStyle: TextStyle(
                      color: _selectedCategory == _categories[index] ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => CourseCard(course: _courses[index]),
                childCount: _courses.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _filterCourses() {
    // Implement filtering logic
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  void _navigateToCourseDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailScreen(course: course),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => _navigateToCourseDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(course.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(course.description, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              Text('Price: ${course.price}', style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(course.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Open the video tutorial link
                if (await canLaunch(course.videoUrl)) {
                  await launch(course.videoUrl);
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch ${course.videoUrl}')),
                  );
                }
              },
              child: const Text('Watch Video Tutorial'),
            ),
            // Add more course details here
          ],
        ),
      ),
    );
  }
  
  canLaunch(String videoUrl) {}
  
  launch(String videoUrl) {}
}