import 'package:flutter/material.dart'; // Add this import

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String thumbnailUrl;
  final VoidCallback onTap;
  final Map<String, String> course;

  // ignore: use_super_parameters
  const CourseCard({
    Key? key, // Add the key parameter
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.onTap,
    required this.course,
  }) : super(key: key); // Pass the key to the superclass

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.network(thumbnailUrl), // Use Image.network for loading images from URLs
            Text(title), // Display the title
            Text(description), // Display the description
          ],
        ),
      ),
    );
  }
}