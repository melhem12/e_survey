import 'package:e_survey/Models/claimsResponse.dart';
import 'package:http/http.dart';
import 'dart:convert';

class mySurveyApi {
  List<claimsResponse> claims = [];


  Future<List<claimsResponse>> get_data(String userId ) async {
    try {
      Response response = await get(
          Uri.parse('http://localhost:8083/api/v1/esurvey/constant/getDailySurvey?userId='+userId));

      claims = [];
      final extractedData = json.decode(response.body)['claimBeanList'];
      for (var i in extractedData) {
        claims.add(claimsResponse(
          notificationId: i["notificationId"],
          claimStatusCode: i['claimStatusCode'],
            reportedDate:i['reportedDate'],
            companyCode:i['companyCode']
        ));
      }
    }catch(e ){
      print('error=$e');
    }
    return claims;
  }
}
