import 'package:elearning_app/data/models/course.dart';
import 'package:flutter/material.dart';

class ExploreCoursesScreen extends StatefulWidget {
  const ExploreCoursesScreen({super.key});

  @override
  State<ExploreCoursesScreen> createState() => _ExploreCoursesScreenState();
}

class _ExploreCoursesScreenState extends State<ExploreCoursesScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _selectedSort = 'Most Popular';
  final List<Course> _courses = []; // Populate with actual course data

  final List<String> _categories = [
    'All', 'Programming', 'Design', 'Business', 'Marketing', 'Data Science'
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
                      color: _selectedCategory == _categories[index] 
                          ? Colors.white 
                          : Colors.black,
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
    // Implement navigation logic here
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
              // Add your course card content here
              Text(course.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(course.description, style: const TextStyle(fontSize: 14)),
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
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(course.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(course.description, style: const TextStyle(fontSize: 16)),
            // Add more course details here
          ],
        ),
      ),
    );
  }
}