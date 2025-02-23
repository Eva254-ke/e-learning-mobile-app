import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CourseVideoScreen extends StatefulWidget {
  final String videoUrl;
  final String courseTitle;

  const CourseVideoScreen({
    super.key,
    required this.videoUrl,
    required this.courseTitle,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CourseVideoScreenState createState() => _CourseVideoScreenState();
}

class _CourseVideoScreenState extends State<CourseVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Extract the video ID from the YouTube URL
    final videoId = YoutubePlayerController.convertUrlToId(widget.videoUrl);
    if (videoId == null) {
      throw Exception('Invalid YouTube URL');
    }

    // Initialize the YouTube player controller
    _controller = YoutubePlayerController(
      params: const YoutubePlayerParams(
        showControls: true,
        mute: false,
        showFullscreenButton: true,
        loop: false,
      ),
    )..loadVideoById(videoId: videoId);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  // Function to get course description based on course title
  String _getCourseDescription(String courseTitle) {
    switch (courseTitle) {
      case 'Introduction to Programming':
        return 'Dive into the world of programming with this beginner-friendly course. Learn the fundamentals of Python, including variables, loops, functions, and basic data structures. Perfect for those starting their coding journey!';
      case 'Data Structures and Algorithms':
        return 'Master the building blocks of efficient programming. This course covers essential data structures like arrays, linked lists, trees, and graphs, along with algorithms for sorting, searching, and optimization. Ideal for acing technical interviews!';
      case 'Web Development Bootcamp':
        return 'Build modern, responsive websites from scratch. Learn HTML, CSS, and JavaScript, and explore frameworks like React and Node.js. By the end, you’ll be able to create dynamic web applications.';
      case 'Mobile App Development with Flutter':
        return 'Create stunning cross-platform mobile apps using Flutter and Dart. This course covers everything from UI design to state management, ensuring you can build apps for both Android and iOS with a single codebase.';
      case 'Machine Learning Fundamentals':
        return 'Explore the fascinating world of machine learning and AI. Learn about supervised and unsupervised learning, neural networks, and how to build predictive models using Python and TensorFlow.';
      default:
        return 'Discover the exciting world of technology with this comprehensive course. Gain hands-on experience and practical skills to advance your career.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final courseDescription = _getCourseDescription(widget.courseTitle);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Video'),
      ),
      body: Column(
        children: [
          // YouTube video player
          YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9, // Set the aspect ratio
          ),
          // Additional content (e.g., video title, description, etc.)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.courseTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              courseDescription,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}