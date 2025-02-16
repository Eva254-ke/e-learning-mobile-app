import 'package:flutter/material.dart';
import '../../data/models/course.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is Flutter?',
      'answers': ['A framework', 'A language', 'A database'],
      'correctAnswer': 0,
    },
    {
      'question': 'What language does Flutter use?',
      'answers': ['Dart', 'Java', 'Python'],
      'correctAnswer': 0,
    },
  ];

  void _answerQuestion(int selectedAnswer) {
    if (selectedAnswer == _questions[_currentQuestionIndex]['correctAnswer']) {
      _score++;
    }
    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Course course = ModalRoute.of(context)!.settings.arguments as Course;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${course.title}'),
      ),
      body: _currentQuestionIndex < _questions.length
          ? Column(
              children: [
                // Question
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    _questions[_currentQuestionIndex]['question'],
                    style: TextStyle(fontSize: 18),
                  ),
                ),

                // Answers
                ...(_questions[_currentQuestionIndex]['answers'] as List<String>)
                    .asMap()
                    .entries
                    .map((entry) => ElevatedButton(
                          onPressed: () => _answerQuestion(entry.key),
                          child: Text(entry.value),
                        ))
                    // ignore: unnecessary_to_list_in_spreads
                    .toList(),
              ],
            )
          : Center(
              child: Text('Your score is $_score/${_questions.length}'),
            ),
    );
  }
}