import 'package:flutter/material.dart';
import 'result.dart';

class Data {
  String text;
  int counter;
  String dateTime;
  Data({this.text, this.counter, this.dateTime});
}


class Input extends StatefulWidget {
  static String id='input';
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  String endstcode;
  String startstcode;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  textAlign: TextAlign.center,

                  onChanged: (value) {
                    //Do something with the user input.
                    startstcode=value;
                  },

                ),
                SizedBox(
                  height: 8.0,
                ),

                FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Results.id);
                  },
                  child: Icon(Icons.navigation),
                  backgroundColor: Colors.green,
                ),


              ])

    );
  }
}
