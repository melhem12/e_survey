import 'dart:developer';

import 'package:e_survey/args/claimsListArgs.dart';
import 'package:e_survey/args/mySurveyArgs.dart';
import 'package:e_survey/service/claimsApi.dart';
import 'package:e_survey/utility/sql_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dataInputPersonalInformation.dart';

class ClaimsList extends StatefulWidget {
String ?notification ;
  String ?companyCode ;
String ?notificationId ;
  ClaimsList(this.notification, this.companyCode,this.notificationId);

  @override
  _ClaimsListState createState() => _ClaimsListState();
}

class _ClaimsListState extends State<ClaimsList> {
  SharedPreferences? _prefs;

  static const String frontLicencePrefKey = 'front_licence_pref';
  static const String pathsListPrefKey = 'pathsList_pref';
  static const String backCarRegistrationrefKey = 'back_CarRegistration_pref';
  static const String frontCarRegistrationPrefKey = 'front_CarRegistration_pref';
  static const String policyPrefKey = 'policy_pref';
  static const String vinPrefKey = 'vin';
  static const String backLicencePrefKey = 'back_licence_pref';


  static const String userIDPrefKey = 'userId_pref';
  String savedUid = "";

  @override
  void initState() {
    log("llllllllllll");
    log(widget.notificationId.toString());
    log(widget.notification.toString());
    log(widget.companyCode.toString());

    SharedPreferences.getInstance().then((prefs) {
      setState(() => this._prefs = prefs);
      _loadUserId();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // final args = ModalRoute.of(context)!.settings.arguments as mySurveyArgs;

    return


      Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(


          onPressed: () {













            showDialog<String>(
              context: context,
              builder: (BuildContext
              context) =>
                  AlertDialog(
                    title: const Text(
                        'Add Tp'),
                    content: const Text(
                      'Are you sure you want to Add  Tp',
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(
                                context,
                                'Cancel'),
                        child: const Text(
                            'Cancel'),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(
                                context,
                                'yes'),
                        child: const Text(
                            'yes'),
                      ),
                    ],
                  ),
            ).then((returnVal) {
              if (returnVal == "yes") {



            _insertLossCar(widget.notification.toString(), savedUid);
                ScaffoldMessenger.of(
                    context)
                    .showSnackBar(
                  SnackBar(
                    backgroundColor:
                    Colors.blue,
                    content: Text("added"),

                    //action: SnackBarAction(label: 'OK', onPressed: () {}),
                  ),
                );
              }
            });












          },
          child: const Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
      ),
      appBar: AppBar(
        title: Text("Claims List"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: FutureBuilder(
                  future: claimsApi()
                      .get_claims_details(widget.notificationId.toString(), widget.companyCode.toString()),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                              onTap: () {
                                if(snapshot.data[index].surveyDamagedLockedUser=="null"){
                                _insertCarsSurvey(snapshot.data[index].carId, savedUid);
                                SQLHelper.deleteAll();
                                _prefs!.remove(policyPrefKey);
                                _prefs!.remove(vinPrefKey);
                                _prefs!.remove(frontCarRegistrationPrefKey);
                                _prefs!.remove(backCarRegistrationrefKey);
                                _prefs!.remove(frontLicencePrefKey);
                                _prefs!.remove(backLicencePrefKey);
                                _prefs!.remove(pathsListPrefKey);
                                _prefs!.remove("stringList");

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DataInputPersonalInformation( companyCode: widget.companyCode.toString(),carId: snapshot.data[index].carId,vehicleNumber: snapshot.data[index].vehicleNumber,notification:widget.notification.toString(),notificationId:widget.notificationId.toString())
                                ));

                                }
                              },
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[index].vehicleOwnerName,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        snapshot.data[index].brandTrademark,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Text(
                                        snapshot.data[index].accidentLocation,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            snapshot.data[index]
                                                        .vehicleNumber ==
                                                    "0"
                                                ? "insured"
                                                : "TP",
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          snapshot.data[index].vehicleNumber ==
                                                      "0" ||
                                                  snapshot.data[index]
                                                          .surveyDamagedLockedUser !=
                                                      "null"
                                              ? Text("")
                                              : IconButton(
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  onPressed: () {
                                                    showDialog<String>(
                                                      context: context,
                                                      builder: (BuildContext
                                                              context) =>
                                                          AlertDialog(
                                                        title: const Text(
                                                            'Delete Tp'),
                                                        content: const Text(
                                                          'Are you sure you want to delete this Tp',
                                                        ),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context,
                                                                    'Cancel'),
                                                            child: const Text(
                                                                'Cancel'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context,
                                                                    'yes'),
                                                            child: const Text(
                                                                'yes'),
                                                          ),
                                                        ],
                                                      ),
                                                    ).then((returnVal) async {
                                                      if (returnVal == "yes") {
                                                       bool isDeleted= await     _deleteSuvey(
                                                                snapshot
                                                                    .data[index]
                                                                    .carId,
                                                                savedUid);
                                                       if(isDeleted){
                                                         ScaffoldMessenger.of(
                                                             context)
                                                             .showSnackBar(
                                                             SnackBar(
                                                             backgroundColor:
                                                             Colors.green,
                                                             content: Text("delete succes ")),);

                                                       }else{
                                                         ScaffoldMessenger.of(
                                                             context)
                                                             .showSnackBar(
                                                           SnackBar(
                                                             backgroundColor:
                                                             Colors.red,
                                                             content: Text("you can not delete this  Tp"),

                                                           ),
                                                         );
                                                       }

                                                      }
                                                    });






                                                  },
                                                ),
                                        ],
                                      ),

                                      // SizedBox(
                                      //   height: 5.0,
                                      // ),
                                    ],
                                  ),
                                ),
                                elevation: 5.0,
                                shadowColor: Colors.black54,
                              ));
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return
                        Center(
                          child: CircularProgressIndicator()
                          ,
                        );
                    }
                  })),
        ],
      ),
    );
  }

  Future<bool> _deleteSuvey(String carId, String userId) async {
  bool isDeleted =   await claimsApi().deleteCarsSurvey(carId, userId);
     setState(() {

     });
     return isDeleted;
  }
  _insertLossCar(String notification, String userId) async {
     await claimsApi().insertLossCar(notification, userId);
     setState(() {

     });
  }
  _insertCarsSurvey(String carId,String userId) async{
    await claimsApi().insertCarsSurvey(carId, userId);

  }
  void _loadUserId() {
    setState(() {
      this.savedUid = this._prefs?.getString(userIDPrefKey) ?? "";
    });
  }
}
