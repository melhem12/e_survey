import 'dart:developer';

import 'package:e_survey/View/expert_missions.dart';
import 'package:e_survey/args/personalInfoArgs.dart';
import 'package:e_survey/pages/CarInfoInput.dart';
import 'package:e_survey/pages/DriverLicenceDashboard.dart';
import 'package:e_survey/pages/HistorySearch.dart';
import 'package:e_survey/pages/Policy.dart';
import 'package:e_survey/pages/claimsList.dart';
import 'package:e_survey/pages/dashboard.dart';
import 'package:e_survey/pages/dataInputCarInformation.dart';
import 'package:e_survey/pages/dataInputPersonalInformation.dart';
import 'package:e_survey/pages/driverLicenseImage.dart';
import 'package:e_survey/pages/home.dart';
import 'package:e_survey/pages/metPage.dart';
import 'package:e_survey/pages/mySurvey.dart';
import 'package:e_survey/pages/parts.dart';
import 'package:e_survey/pages/requiredDocuments.dart';
import 'package:e_survey/pages/searchSurvey.dart';
import 'package:e_survey/pages/signin.dart';
import 'package:e_survey/pages/survey.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

import 'args/claimsListArgs.dart';

void  main()  async=>
    {
      await GetStorage.init(),
      runApp(GetMaterialApp(
        initialRoute: '/',
// onGenerateRoute: (settings){
//   if(settings.name==DataInputPersonalInformation.routeName){
//     final args = settings.arguments as claimsListArgs ;
//     log("tttttttttttttttt");
//     log(args.carId);
//     log("tttttttttttttttt");
//     return MaterialPageRoute(
//       builder: (context) {
//         return  DataInputPersonalInformation(
//           companyCode: args.companyCode.toString(),
//           carId: args.carId.toString(),
//
//           vehicleNumber: args.vehicleNumber.toString(),
//         );
//       },
//     );
//   }
// },
        routes: {
          '/home': (context) => Home(),
          '/missions': (context) => ExpertMissions(),
          '/dashboard': (context) => Dashboard(),
          '/': (context) => Signin(),
          '/mySurvey': (context) => mySurvey(),
          '/Survey': (context) => Survey(),
          '/SearchSurvey': (context) => SearchSurvey(),
          '/CarInfoInput': (context) => CarInfoInput(),
          '/RequiredDocuments': (context) => RequiredDocuments(),
          '/DriverLicenceImage': (context) => DriverLicenceImage(),
          '/DriverLicenceDashboard': (context) => DriverLicenceDashboard(),
          '/HistorySearch': (context) => HistorySearch(),
          '/policy': (context) => Policy(),

        },

      ))

    }
    ;