import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'input.dart';
class Results extends StatefulWidget {

  static String id='result';
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {



  List userData;
  String date;
  String stcode='umb';
  String endcode='cdg';

  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  Future getData() async {
    http.Response response = await http.get("https://api.railwayapi.com/v2/between/source/$stcode/dest/$endcode/date/27-01-2020/apikey/d7kqe59rvz/");
    var data = json.decode(response.body);
    setState(() {
      userData = data["trains"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trains"),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(

        itemCount: userData == null ? 0 : userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[


                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:TextField(
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        //Do something with the user input.
                        stcode=value;
                      },

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${userData[index]["name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${userData[index]["name"]}",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Train number:${userData[index]["number"]}",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Departure Time:${userData[index]["src_departure_time"]}",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Station: ${userData[index]["from_station"]["name"]} to ${userData[index]["to_station"]["name"]}",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Days:${userData[index]["days"]}",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
