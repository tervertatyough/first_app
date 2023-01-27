import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 12) {
      resultText = "Pretty Likeable";
    } else if (resultScore <= 16) {
      resultText = "Strange";
    } else {
      resultText = "You are so Bad";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(onPressed: resetHandler, child: Text("Reset Quiz"))
        ],
      ),
    );
  }
}
