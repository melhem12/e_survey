import 'package:e_survey/service/mySurveyApi.dart';
import 'package:e_survey/utility/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int counter=10;
  @override
  void initState()  {
    asyncMethod();
    super.initState();
  }

  void asyncMethod() async {
   int  count=  await mySurveyApi().get_count("MMEHDI");
setState(() {
  counter=count;
}
);
    // ....
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
    crossAxisCount: 2,

    padding: EdgeInsets.all(3.0),
    children: <Widget>[

      // Text(""),
      makeDashboardItem("My Survey", Icons.task,"/mySurvey",context),
      makeDashboardItem("Search My Survey", Icons.search,"/HistorySearch",context),
      makeDashboardItem("Daily Task Count "  + counter.toString(), Icons.format_list_numbered,"",context),

    ],
  ),
),
    Container(
        height: 30,
        child:
        Container(
          width: double.infinity,
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
    )
]

        ,)


       ),



    );
  }
}
