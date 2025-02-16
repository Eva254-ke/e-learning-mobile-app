class Course {
  final String id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final String videoUrl;

  Course({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.videoUrl,
  });

  // Factory constructor to create a Course object from JSON
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnailUrl: json['thumbnailUrl'],
      videoUrl: json['videoUrl'],
    );
  }
}