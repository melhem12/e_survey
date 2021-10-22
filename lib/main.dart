import 'package:e_survey/pages/dashboard.dart';
import 'package:e_survey/pages/dataInputCarInformation.dart';
import 'package:e_survey/pages/dataInputPersonalInformation.dart';
import 'package:e_survey/pages/home.dart';
import 'package:e_survey/pages/mySurvey.dart';
import 'package:e_survey/pages/parts.dart';
import 'package:e_survey/pages/searchSurvey.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => DataInputPersonalInformation(),
    '/dashboard': (context) => Dashboard(),
    '/home': (context) => Home(),
    '/mySurvey': (context) => mySurvey(),
  },
));
