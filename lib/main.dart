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
  final questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': ['Black', 'Red', 'Green', 'White']
    },
    {
      'questionText': 'What is your favorite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
    },
    {
      'questionText': 'What is your favorite food?',
      'answers': ['Pizza', 'Pasta', 'Sushi', 'Tacos']
    },
  ];

  var questionIndex = 0;

  void answerQuestion() {
    // Need to use setState to update the state of the app
    // Set state will trigger the build method that rebuilds the UI widget tree
    setState(() {
      questionIndex = questionIndex + 1;
      // if (questionIndex == questions.length) {
      //   questionIndex = 0;
      // }
    });

    print(questionIndex);
  }

  restart() {
    print('restart');
    questionIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Revive IV'),
        ),
        body: questionIndex < questions.length || questionIndex == 0
            ? Column(
                children: [
                  // I'm referencing the Question class here from the question.dart file
                  Question(
                    questions[questionIndex]['questionText'] as String,
                  ),
                  ...(questions[questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(answerQuestion, answer);
                  }).toList(),
                ],
              )
            : Center(
                child: RaisedButton(
                  child: Text('You did it!, Restart'),
                  onPressed: restart,
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              ),
      ),
    );
  }
}
