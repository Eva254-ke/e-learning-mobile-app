Here’s the updated `README.md` as a Markdown file. You can copy and save this as `README.md` in your project:

```markdown
# SmartLearn - Mobile Learning Platform

![SmartLearn Logo](assets/images/logo.jpg)

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
To run the app on a physical phone instead of Chrome:
1. Connect your physical phone to your computer via USB.
2. Enable USB debugging on your phone.
3. Run the app using:
```bash
flutter run -d <device_id>
```
Replace `<device_id>` with the ID of your connected device. You can find the device ID by running:
```bash
flutter devices
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
SmartLearn © 2025. All rights reserved. SmartLearn is a trademarked by Eva254-ke. SmartLearn is licensed under the MIT License. You may not use SmartLearn for any commercial purpose without obtaining a license from Eva254-ke. SmartLearn is not intended for use in any environment where it may be used to harm or deceive others. SmartLearn is not intended for use in any environment where it may be Proprietary software.
```

### Steps to Use This File:
1. Copy the content above.
2. Create a new file named `README.md` in your project's root directory.
3. Paste the content into the file.
4. Save the file.

### Additional Steps:
- Ensure the logo file (`logo.jpg`) is placed in the `assets/images/` directory.
- Update the `pubspec.yaml` file to include the logo in the `assets` section:
```yaml
flutter:
  assets:
    - assets/images/logo.jpg
```
