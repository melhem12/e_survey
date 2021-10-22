import 'package:e_survey/service/mySurveyApi.dart';
import 'package:e_survey/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int counter=0;
  @override
  void initState() {
    counter= mySurveyApi().get_count("MMEHDI") as int;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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

    flex: 1, child:   Text("Dashboard",
        style: GoogleFonts.pacifico(
            fontWeight: FontWeight.bold, fontSize: 40, color: Colors.blue)),
  ),
    Expanded(
 flex:6,
   child: GridView.count(
    crossAxisCount: 1,

    padding: EdgeInsets.all(3.0),
    children: <Widget>[

      // Text(""),
      makeDashboardItem("My Survey", Icons.task,"/mySurvey",context),
      makeDashboardItem("Search My Survey", Icons.search,"/",context),
      makeDashboardItem("Daily Task Count "  + counter.toString(), Icons.format_list_numbered,"",context),

    ],
  ),
),

]

        ,)
      //   child: Text("Dashboard",
      //       style: GoogleFonts.pacifico(
      //           fontWeight: FontWeight.bold, fontSize: 50, color: Colors.blue)),



        // child:
        // GridView.count(
        //   crossAxisCount: 2,
        //   padding: EdgeInsets.all(3.0),
        //   children: <Widget>[
        //   Text("Dashboard",
        //        style: GoogleFonts.pacifico(
        //          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.blue)),
        //     Text(""),
        //     makeDashboardItem("My Survey", Icons.task),
        //     makeDashboardItem("Search My Survey", Icons.search),
        //     makeDashboardItem("Daily Task Count", Icons.format_list_numbered),
        //     makeDashboardItem("", Icons.task),
        //
        //   ],
        // ),

       ),



    );
  }
}
