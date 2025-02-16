import '../api/course_api.dart';

class CourseRepositoryImpl {
  final CourseApi courseApi;

  CourseRepositoryImpl({required this.courseApi});

  Future<List<dynamic>> getCourses() async {
    return await courseApi.getCourses();
  }
}
