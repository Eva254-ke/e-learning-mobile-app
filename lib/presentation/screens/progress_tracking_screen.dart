import 'package:flutter/material.dart';

class ProgressTrackingScreen extends StatelessWidget {
  final bool isLoggedIn; // Simulate login state
  final Map<String, double> courseProgress; // Simulate progress data

  const ProgressTrackingScreen({
    super.key,
    this.isLoggedIn = false, // Default to false for demonstration
    this.courseProgress = const {
      'Flutter Basics': 0.3,
      'Advanced Dart': 0.7,
      'State Management': 0.5,
    },
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Progress'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: isLoggedIn
          ? _buildProgressList()
          : _buildLoginPrompt(context),
    );
  }

  // Build progress list if user is logged in
  Widget _buildProgressList() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: courseProgress.length,
      itemBuilder: (context, index) {
        final courseTitle = courseProgress.keys.elementAt(index);
        final progress = courseProgress[courseTitle]!;
        return Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              courseTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade700),
                ),
                SizedBox(height: 8),
                Text(
                  '${(progress * 100).toStringAsFixed(1)}% completed',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Build login prompt if user is not logged in
  Widget _buildLoginPrompt(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_outline,
              size: 80,
              color: Colors.grey[600],
            ),
            SizedBox(height: 20),
            Text(
              'Track Your Progress',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Sign up or log in to view and track your course progress.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to Sign Up Screen
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                backgroundColor: Colors.blue.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                // Navigate to Log In Screen
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                side: BorderSide(color: Colors.blue.shade700),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Log In',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}