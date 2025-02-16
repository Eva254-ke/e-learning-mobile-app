import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course.dart'; // Ensure this path is correct

class CourseApi {
  static const String baseUrl = 'https://api.example.com';

  Future<List<Course>> fetchCourses() async {
    final response = await http.get(Uri.parse('$baseUrl/courses'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Course.fromJson(json)).toList(); // Use fromJson
    } else {
      throw Exception('Failed to load courses');
    }
  }

  getCourses() {}
}
