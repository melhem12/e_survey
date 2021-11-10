import 'package:e_survey/args/CarImputArgs.dart';
import 'package:e_survey/pages/DamagedPictures.dart';
import 'package:e_survey/pages/DriverLicenceDashboard.dart';
import 'package:e_survey/pages/driverLicenseImage.dart';
import 'package:e_survey/pages/parts.dart';
import 'package:flutter/material.dart';

InputDecoration buildInputDecoration(String hintText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
     hintText: hintText,
    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  );
}
late final VoidCallback callback;

Card makeDashboardItem(String title, IconData icon,String path,BuildContext context) {
  return Card(
      elevation: 2,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamed(context,path);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                    icon,
                    size: 40.0,
                    color: Colors.blue,
                  )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style:
                    new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ));
}

Card makeDashboardItem2(String title, IconData icon, String path,BuildContext context,String carId ,String var1 ,String var2) {
  return Card(
      elevation: 2,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: new InkWell(
          onTap: () {if(
          path=='/DriverLicenceDashboard'
          ){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>DriverLicenceDashboard()));
          }
          if(
          path=='/DriverLicenceImage'
          ){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>DriverLicenceImage()));
          }
          if(
          path=='/damagePictures'
          ){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>DamagedPictures()));
          }
          if(
          path=='/parts'
          ){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>parts(),settings: RouteSettings(
            arguments:CarImputArgs (carId: carId,bodyType: var1,doors: var2)),));
          }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                    icon,
                    size: 40.0,
                    color: Colors.blue,
                  )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style:
                    new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ));
}


MaterialButton longButtons(String title, Function fun,
    {Color color: Colors.blue, Color textColor: Colors.white}) {
  return MaterialButton(
    onPressed: fun(),
    textColor: textColor,
    color: color,
    child: SizedBox(
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
      ),
    ),
    height: 45,
    minWidth: 600,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  );
}
