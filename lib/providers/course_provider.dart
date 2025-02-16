import 'package:flutter/material.dart';
import '../data/repositories/course_repository_impl.dart';

class CourseProvider extends ChangeNotifier {
  final CourseRepositoryImpl courseRepository;
  List<dynamic> courses = [];

  CourseProvider({required this.courseRepository}) {
    loadCourses();
  }

  bool? get isLoading => null;

  Future<void> loadCourses() async {
    courses = await courseRepository.getCourses();
    notifyListeners();
  }

  void fetchCourses() {}
}
