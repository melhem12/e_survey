import 'dart:developer';

import 'package:e_survey/args/BigArgs.dart';
import 'package:e_survey/args/CarImputArgs.dart';
import 'package:e_survey/pages/summery.dart';
import 'package:e_survey/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DamageDashboard extends StatefulWidget {
  const DamageDashboard({Key? key}) : super(key: key);

  @override
  _DamageDashboardState createState() => _DamageDashboardState();
}

class _DamageDashboardState extends State<DamageDashboard> {

  @override
  Widget build(BuildContext context) {

    final args =ModalRoute.of(context)!.settings.arguments as BigArgs;
    log("nnnnnnnnnnn") ;
    log(args.carId);
    log("nnnnnnnnnnn") ;

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

                flex: 3, child:   Text("Survey Damage  Details ",
                  style: GoogleFonts.pacifico(
                      fontWeight: FontWeight.bold, fontSize: 40, color: Colors.blue)),
              ),
              Expanded(
                flex:10,
                child: GridView.count(
                  crossAxisCount: 2,

                  padding: EdgeInsets.all(3.0),
                  children: <Widget>[

                    // Text(""),
                    makeDashboardItem2("Add Damage Part ", Icons.car_repair,"/parts",context,args.carId,args.doors,args.bodyType),
                    makeDashboardItem2("uploads Photos", Icons.camera,"/damagePictures",context,'','',''),


                    //makeDashboardItem("", Icons.task,"/",context),

                  ],
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
                                MaterialPageRoute(builder: (context) => Summery(args.carId,args.fName, args.fatherName,args.lName,args.brand,args.tradeMark,args.companyCode,args.notification,args.notificationId))
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




            ]

            ,)


      ),



    );
  }
}
