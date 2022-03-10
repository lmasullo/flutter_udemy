import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // const Question({ Key? key }) : super(key: key);
  // implement key
  // const Question ({ Key? key }) : super(key: key);

  // This tells Dart that it will never changed after it is created.
  final String questionText;

  Question(this.questionText);

  @override
  @override
  Widget build(BuildContext context) {
    // Wrap text in container to apply center using width: double.infinity
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        // This is like REMs in CSS, base is 14px
        textScaleFactor: 2,
        textAlign: TextAlign.center,
      ),
    );
  }
}
