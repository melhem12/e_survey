import 'dart:convert';

import 'package:e_survey/Models/claimsResponse.dart';
import 'package:e_survey/service/mySurveyApi.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';



class mySurvey extends StatefulWidget {
  @override
  _mySurveyState createState() => _mySurveyState();
}

class _mySurveyState extends State<mySurvey> {
List <claimsResponse> claims=[];
  @override

  Future<void> initState()
  async {
    claims = await  mySurveyApi().get_data("MMEHDI");

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (title: Text(""),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: claims.length,
              itemBuilder: (BuildContext context, index){
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          claims[index].notificationId,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          claims[index].reportedDate,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                  elevation: 5.0,
                  shadowColor: Colors.black54,
                );
              },
            ),
          ),
        ],
      ),
    );
  }


}