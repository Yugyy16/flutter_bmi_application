import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final int bmiResult;
  const ResultScreen({super.key, required this.bmiResult});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text("Result Screen"),
      ),
      body: Container(
        color: Colors.blue[300],
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "Your BMI is \n       ${widget.bmiResult}  ",
              style: TextStyle(fontSize: 40),
            )
          ],
        ),
      ),
    );
  }
}
