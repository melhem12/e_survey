import 'dart:async';
import 'package:e_survey/Models/company.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataInputCarInformation extends StatefulWidget {
  const DataInputCarInformation({Key? key}) : super(key: key);

  @override
  _DataInputCarInformationState createState() => _DataInputCarInformationState();
}

class _DataInputCarInformationState extends State<DataInputCarInformation> {
 double height =15;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
         // appBar: AppBar(title: Text("asdsadasdas")),
          body: SafeArea(
            child: SingleChildScrollView(
              child:
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
    child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        child: Text("Vehicle Information",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              )),
      ),
      SizedBox(height: height,),
      Container(
        child: Column(
            children: <Widget>[
              Text("Make Name ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )),
              //dropdownhere ......
            ],
        ),
      ),
      SizedBox(height: height,),
      Container(
        child: Column(
            children: <Widget>[
              Text("Model Name ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )),
            ],
      ),
              ),
              //dropdownhere ......

              SizedBox(height: height,),
              TextField(
                style: TextStyle(
                  color: Color.fromARGB(255, 38, 97, 250),
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Year',
                  isDense: true,
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 38, 97, 250),
                  ),
                  hintText: "Enter Year",

                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 38, 97, 250),
                  ),
                  fillColor: Colors.grey[300],
                  border: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                  ),
                  filled: true,
                ),
              ),
              SizedBox(height: height,),
              TextField(
                style: TextStyle(
                  color: Color.fromARGB(255, 38, 97, 250),
                ),

                decoration: InputDecoration(
                  labelText: 'Chasis Number',
                  isDense: true,
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 38, 97, 250),
                  ),
                  hintText: "Enter Chasis Number",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 38, 97, 250),
                  ),
                  fillColor: Colors.grey[300],
                  border: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                  ),
                  filled: true,
                ),
              ),
              SizedBox(height: height,),
              TextField(
                style: TextStyle(
                  color: Color.fromARGB(255, 38, 97, 250),
                ),

                decoration: InputDecoration(
                  labelText: 'Plate Number',
                  isDense: true,
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 38, 97, 250),
                  ),
                  hintText: "Enter Plate Number",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 38, 97, 250),
                  ),
                  fillColor: Colors.grey[300],
                  border: InputBorder.none,
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                    BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                  ),
                  filled: true,
                ),
              ),
      SizedBox(height: height,),
      Container(
        child: Column(
            children: <Widget>[
              Text("Vehicle Size ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )),
            ],
        ),
      ),
      SizedBox(height: height,),
      Container(
        child: Column(
            children: <Widget>[
              Text("Body Type ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )),
            ],
        ),
      ),
      SizedBox(height: height,),
      Container(
        child: Column(
            children: <Widget>[
              Text("Doors ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  )),
            ],
        ),
      ),
      Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0),
        child: Text("Insurance Information",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
              )),
      ),
      TextField(
        style: TextStyle(
            color: Color.fromARGB(255, 38, 97, 250),
        ),

        decoration: InputDecoration(
            labelText: 'Policy Number',
            isDense: true,
            labelStyle: TextStyle(
              color: Color.fromARGB(255, 38, 97, 250),
            ),
            hintText: "Policy Number",
            hintStyle: TextStyle(
              color: Color.fromARGB(255, 38, 97, 250),
            ),
            fillColor: Colors.grey[300],
            border: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
            ),
            filled: true,
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  child: ElevatedButton(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 38, 97, 250),
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                )),
            SizedBox(
              width: 10,
            ),
            SizedBox(height: height,),
            Expanded(
                flex: 1,
                child: Container(
                  child: ElevatedButton(
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 38, 97, 250),
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                ))
        ],
      ),

            ],
        ),
      ),
              ),),
          ),
    ),
            );


  }

}


