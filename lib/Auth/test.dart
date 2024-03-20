import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDatePickerScreen extends StatefulWidget {
  @override
  _MyDatePickerScreenState createState() => _MyDatePickerScreenState();
}

class _MyDatePickerScreenState extends State<MyDatePickerScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    bool isCorrect = true;
    return Text(isCorrect.toString());
  }
}

void main() {
  runApp(MaterialApp(
    home: MyDatePickerScreen(),
  ));
}
