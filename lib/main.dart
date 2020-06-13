import 'package:flutter/material.dart';
import 'input.dart';
import 'result.dart';

void main() => runApp(TrainName());

class TrainName extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Input.id,
      routes:
      {
      Input.id: (context)=>Input(),
        Results.id: (context)=>Results(),

      },
    );
  }
}
