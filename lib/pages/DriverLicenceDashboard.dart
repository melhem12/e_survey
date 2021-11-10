import 'package:e_survey/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DriverLicenceDashboard extends StatefulWidget {
  const DriverLicenceDashboard({Key? key}) : super(key: key);

  @override
  _DriverLicenceDashboardState createState() => _DriverLicenceDashboardState();
}

class _DriverLicenceDashboardState extends State<DriverLicenceDashboard> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      body:
      Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
          margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),

          child:Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(

                flex: 1, child:   Text("Documents required",
                  style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold, fontSize: 40, color: Colors.blue)),
              ),
              Expanded(
                flex:3,
                child: GridView.count(
                  crossAxisCount: 2,

                  padding: EdgeInsets.all(3.0),
                  children: <Widget>[

                    // Text(""),
                    makeDashboardItem2("Front Side Of Driver License", Icons.camera,"/DriverLicenceImage",context,'','',''),
                    makeDashboardItem2("Back Side Of Driver License", Icons.camera,"",context,'','',''),


                    //makeDashboardItem("", Icons.task,"/",context),

                  ],
                ),
              ),


              Expanded(
                flex: 1,

                child:

                SizedBox(

                ),
              ),
              Expanded(
                flex: 1,
                child:


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
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight:
                                    FontWeight.bold)),
                          ),
                        )
                    ),



                  ],
                ),
              )
              ,

            ]

            ,)


      ),



    );
  }
}
