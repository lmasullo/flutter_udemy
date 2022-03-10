// Packages
import 'package:flutter/material.dart';

// Files
import './question.dart';
import './answer.dart';

// Starting point of the app
// This is the main method that will be called when the app is run
// Tell it to run MyApp class
void main() => runApp(MyApp());

// This class will be rewritten as state changes
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //implement createState
    // Connects the state to the widget "MyAppState"
    return _MyAppState();
  }
}
// const MyApp({Key? key}) : super(key: key);

// This class is persistent state of the app
class _MyAppState extends State<MyApp> {
  var questions = [
    'What is your favorite color?',
    'What is your favorite animal?',
    'Third item?'
  ];

  var questionIndex = 0;

  void answerQuestion() {
    // Need to use setState to update the state of the app
    // Set state will trigger the build method that rebuilds the UI widget tree
    setState(() {
      questionIndex = questionIndex + 1;
      if (questionIndex == questions.length) {
        questionIndex = 0;
      }
    });

    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Revive IV'),
        ),
        body: Column(
          children: [
            // I'm referecing the Question class here from the question.dart file
            Question(questions[questionIndex]),
            // Text(questions[1]),
            Answer(answerQuestion),
            RaisedButton(
                child: const Text('Answer 2'), onPressed: (answerQuestion)),
            RaisedButton(
                child: const Text('Answer 3'), onPressed: (answerQuestion)),
          ],
        ),
      ),
    );
  }
}
