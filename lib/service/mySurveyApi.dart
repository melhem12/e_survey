import 'package:e_survey/Models/claimsResponse.dart';
import 'package:e_survey/utility/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class mySurveyApi {
  List<claimsResponse> claims = [];


  Future<List<claimsResponse>> get_data(String userId ) async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.dailySurvey+userId));

      claims = [];
      final extractedData = json.decode(response.body)['claimBeanList'];
      for (var i in extractedData) {
        claims.add(claimsResponse(
          notificationId: i["notificationId"],
          claimStatusCode: i['claimStatusCode'],
            reportedDate:i['reportedDate'],
            companyCode:i['companyCode'],
            notification:i['notification']
        ));
      }
    }catch(e ){
      print('error=$e');
    }
    return claims;
  }



  Future<int> get_count(String userId ) async {
    int counter=0;
    var response = await   http.get(Uri.parse(AppUrl.surveyCount+userId));


    if (response.statusCode == 200) {
      Map <String,dynamic>map=json.decode(response.body);
      counter=map['counter'];
    } else {

      throw Exception('Failed to  get counter');
    }

    return counter;
  }



}
