import 'package:e_survey/pages/dataInputCarInformation.dart';
import 'package:e_survey/pages/dataInputPersonalInformation.dart';
import 'package:e_survey/pages/parts.dart';
import 'package:e_survey/pages/searchSurvey.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => DataInputPersonalInformation(),
  },
));
