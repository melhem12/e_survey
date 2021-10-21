
import 'package:flutter/material.dart';

import 'dataInputPersonalInformation.dart';


class parts extends StatefulWidget {
  const parts({Key? key}) : super(key: key);

  @override
  _partsState createState() => _partsState();
}

class _partsState extends State<parts> {
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
          appBar: AppBar(title: Text("asdsadasdas")),
          body: SingleChildScrollView(
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
                        child: Text("Personal Information",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(height: height,),

                      SizedBox(height: height,),

                      SizedBox(height: height,),
                      SizedBox(height: height,),

                      SizedBox(height: height,),

                      SizedBox(height: height,),
    ]
    ),


    ),
    ),
    ),
        ),
    );
  }
}
