import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Course {
  final String id;
  final String title;
  final String description;
  final String price;
  final String videoUrl;
  final String thumbnailUrl; // Use network image URLs
  final String instructorName;
  final String instructorBio;
  final String instructorImageUrl;
  final double rating;
  final int totalEnrollments;
  final bool isPopular;
  final bool isFree;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.instructorName,
    required this.instructorBio,
    required this.instructorImageUrl,
    this.rating = 4.5,
    this.totalEnrollments = 0,
    this.isPopular = false,
    this.isFree = false,
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
  List<Course> _courses = [];
  List<Course> _filteredCourses = [];

  @override
  void initState() {
    super.initState();
    _courses = _initialCourses(); // Initialize courses in initState
    _filteredCourses = _courses; // Initially, filtered courses are all courses
  }

  List<Course> _initialCourses() {
    return [
      Course(
        id: '1',
        title: 'Java Programming and Software Engineering Fundamentals',
        description: 'Learn Java and software engineering principles.',
        price: '\$16.99',
        videoUrl: 'https://www.coursera.org/learn/java-programming',
        thumbnailUrl:
            'https://images.unsplash.com/photo-1542831323-533a410366ea?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        instructorName: 'John Doe',
        instructorBio: 'Senior Software Engineer with 10+ years of experience.',
        instructorImageUrl: 'https://example.com/instructor1.jpg',
        rating: 4.7,
        totalEnrollments: 1200,
        isPopular: true,
      ),
      Course(
        id: '2',
        title: 'Introduction to Software Engineering',
        description: 'Understand the software development life cycle.',
        price: '\$0 (Free)',
        videoUrl: 'https://www.coursera.org/learn/introduction-to-software-engineering',
        thumbnailUrl:
            'https://images.unsplash.com/photo-1518770660439-464ef546894d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        instructorName: 'Jane Smith',
        instructorBio: 'Software Architect and Educator.',
        instructorImageUrl: 'https://example.com/instructor2.jpg',
        rating: 4.5,
        totalEnrollments: 950,
        isFree: true,
      ),
      Course(
        id: '3',
        title: 'Software Engineering Bootcamp',
        description: 'Full stack development and software engineering skills.',
        price: 'Ksh 174,000',
        videoUrl: 'https://moringaschool.com/courses/software-engineering-full-stack-web-development/',
        thumbnailUrl:
            'https://images.unsplash.com/photo-1583508916854-959c739555c3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        instructorName: 'Alice Johnson',
        instructorBio: 'Full Stack Developer and Mentor.',
        instructorImageUrl: 'https://example.com/instructor3.jpg',
        rating: 4.8,
        totalEnrollments: 1500,
        isPopular: true,
      ),
      Course(
        id: '4',
        title: 'Data Science and Machine Learning with Python',
        description: 'Master data analysis, machine learning, and predictive modeling.',
        price: '\$29.99',
        videoUrl: 'https://www.coursera.org/learn/machine-learning-with-python',
        thumbnailUrl:
            'https://images.unsplash.com/photo-1519389950473-47a04ca0ecd8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        instructorName: 'Dr. Emily White',
        instructorBio: 'Data Scientist and AI Researcher.',
        instructorImageUrl: 'https://example.com/instructor4.jpg',
        rating: 4.9,
        totalEnrollments: 2000,
        isPopular: true,
      ),
      Course(
        id: '5',
        title: 'Web Development with React',
        description: 'Build interactive web applications using React.',
        price: '\$19.99',
        videoUrl: 'https://www.coursera.org/learn/react-development',
        thumbnailUrl:
            'https://images.unsplash.com/photo-1615779855004-c68836a3397a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
        instructorName: 'David Brown',
        instructorBio: 'Front-End Developer and UI/UX Designer.',
        instructorImageUrl: 'https://example.com/instructor5.jpg',
        rating: 4.6,
        totalEnrollments: 1100,
      ),
      Course(
        id: '6',
        title: 'Mobile App Development with Flutter',
        description: 'Create cross-platform mobile apps with Flutter.',
        price: '\$24.99',
        videoUrl: 'https://www.coursera.org/learn/flutter-app-development',
        thumbnailUrl:
            'https://images.unsplash.com/photo-1506084868230-bb9d95baaa6a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1544&q=80',
        instructorName: 'Sarah Green',
        instructorBio: 'Mobile App Developer and Consultant.',
        instructorImageUrl: 'https://example.com/instructor6.jpg',
        rating: 4.7,
        totalEnrollments: 1300,
        isPopular: true,
      ),
    ];
  }

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
        // ignore: sized_box_for_whitespace
        title: Container(
          width: double.infinity,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search courses...',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            onChanged: (value) => _filterCourses(value),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0), // Reduced padding
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
                  padding: const EdgeInsets.symmetric(horizontal: 4.0), // Reduced padding
                  child: ChoiceChip(
                    label: Text(_categories[index]),
                    selected: _selectedCategory == _categories[index],
                    onSelected: (selected) => setState(() {
                      _selectedCategory = _categories[index];
                      _filterCourses(_searchController.text);
                    }),
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
            padding: const EdgeInsets.all(8), // Reduced padding
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8, // Reduced spacing
                mainAxisSpacing: 8, // Reduced spacing
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => CourseCard(course: _filteredCourses[index]),
                childCount: _filteredCourses.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _filterCourses(String searchText) {
    setState(() {
      _filteredCourses = _courses.where((course) {
        bool categoryMatch = _selectedCategory == 'All' || _categories.contains(_selectedCategory);
        bool searchMatch = course.title.toLowerCase().contains(searchText.toLowerCase()) ||
            course.description.toLowerCase().contains(searchText.toLowerCase());

        return categoryMatch && searchMatch;
      }).toList();
    });
  }
}

class CourseCard extends StatelessWidget {
  final Course course;

  // ignore: use_super_parameters
  const CourseCard({Key? key, required this.course}) : super(key: key);

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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      course.thumbnailUrl, // Use network image
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 4),
                          Text('${course.rating} (${course.totalEnrollments} enrollments)',
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        course.description,
                        style: const TextStyle(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text('Price: ${course.price}', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            if (course.isPopular)
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Popular',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            if (course.isFree)
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Free',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            Positioned(
              bottom: 10,
              right: 10,
              child: IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.red),
                onPressed: () {
                  // Add to favorites
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  // ignore: use_super_parameters
  const CourseDetailScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(course.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                course.thumbnailUrl, // Use network image
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Center(child: Icon(Icons.error));
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(course.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(course.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text('Price: ${course.price}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('Instructor', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(course.instructorImageUrl),
              ),
              title: Text(course.instructorName),
              subtitle: Text(course.instructorBio),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final Uri url = Uri.parse(course.videoUrl);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch ${course.videoUrl}')),
                  );
                }
              },
              child: const Text('Watch Video Tutorial'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Enrolled in ${course.title}')),
                );
              },
              child: const Text('Enroll Now'),
            ),
          ],
        ),
      ),
    );
  }
}
