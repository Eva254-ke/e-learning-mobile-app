
# SmartLearn - Mobile Learning Platform

![SmartLearn Logo](/api/placeholder/200/40)

A Flutter-based mobile application for online learning and course progress tracking.

## Features
- Course enrollment and management
- Progress tracking with visual indicators
- Provider-based state management
- Clean architecture implementation
- Responsive UI components

## Installation
1. Ensure Flutter 3.0+ is installed
2. Clone repository:
```bash
git clone https://github.com/Eva254-ke/e-learning-mobile-app.git
cd elearning_app
```
3. Install dependencies:
```bash
flutter pub get
```

## Configuration
1. Set up your `config.json` in `lib/config/`
2. Initialize provider configurations in `main.dart`:
```dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CourseProvider()),
      ],
      child: const SmartLearnApp(),
    ),
  );
}
```

## Running the App
```bash
flutter run -d chrome
```

## Key Components
### Progress Tracking Screen
Implements course progress visualization using `LinearProgressIndicator`:
```dart
class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final courseProvider = Provider.of<CourseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Progress'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: courseProvider.courses.length,
        itemBuilder: (context, index) {
          final course = courseProvider.courses[index];
          return ListTile(
            title: Text(course.title),
            subtitle: LinearProgressIndicator(
              value: 0.5, // TODO: Connect to actual progress data
            ),
          );
        },
      ),
    );
  }
}
```

## Contributing
1. Follow BLoC architecture patterns
2. Use provider for state management
3. Maintain clean separation between:
   - Presentation (screens/)
   - Business logic (providers/)
   - Data models (models/)

## License
SmartLearn © 2024 Your Organization. Proprietary software.
