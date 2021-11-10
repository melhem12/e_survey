
import 'package:e_survey/args/CarImputArgs.dart';
import 'package:e_survey/pages/dataInputCarInformation.dart';
import 'package:e_survey/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'damage_dashboard.dart';
class RequiredDocuments extends StatefulWidget {
  const RequiredDocuments({Key? key}) : super(key: key);

  @override
  _RequiredDocumentsState createState() => _RequiredDocumentsState();
}

class _RequiredDocumentsState extends State<RequiredDocuments> {
  @override
  Widget build(BuildContext context) {
    final args =ModalRoute.of(context)!.settings.arguments as CarImputArgs;
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
                flex:6,
                child: GridView.count(
                  crossAxisCount: 2,

                  padding: EdgeInsets.all(3.0),
                  children: <Widget>[

                    // Text(""),
                    makeDashboardItem2("Driving License ", Icons.drive_eta,"/DriverLicenceDashboard",context,'','',''),
                    makeDashboardItem2("Car Registration", Icons.car_rental,"",context,'','',''),
                    makeDashboardItem2("Vin number", Icons.car_rental,"",context,'','',''),
                    makeDashboardItem2("policy", Icons.task,"",context,'','',''),

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
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: ElevatedButton(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: ()  {
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DamageDashboard(),settings: RouteSettings(
                                arguments:CarImputArgs (carId: args.carId,bodyType: args.bodyType,doors: args.doors),
                                )),
                            );

                            }
,
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              textStyle: TextStyle(
                                  fontSize: 30,
                                  fontWeight:
                                  FontWeight.bold)),
                        ),
                      ))

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
