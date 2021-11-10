import 'dart:developer';

import 'package:e_survey/Models/CarParts.dart';
import 'package:e_survey/Models/PartsModel.dart';
import 'package:e_survey/utility/app_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PartMetApi{
  List<PartsModel> parts = [];
  List<CarParts> carparts = [];

  Future<List<PartsModel>> get_Damage_Parts(String carId ) async {
     parts=[];
    var response = await   http.get(Uri.parse(AppUrl.getAllDamagedParts+"carId="+carId));


    if (response.statusCode == 200) {
      final extractedData = json.decode(response.body)['CarsSurveyDamagedPartsReceiveBeanList'];
      log(extractedData.toString());
      for (var i in extractedData) {
        parts.add(PartsModel(
            surveyDamagedDescription: i["surveyDamagedDescription"],
            surveyDamagedPartsId: i['surveyDamagedPartsId'],
            surveyDamagedPartCode:i['surveyDamagedPartCode'],
            surveyDamagedReview:i['surveyDamagedReview'],
            surveyDamagedSeverity:i['surveyDamagedSeverity'],
          surveyDamagedSurveyId:i['surveyDamagedSurveyId'],
          surveyDamagedPartDescription:i['surveyDamagedPartDescription'],
          surveyDamagedPartArabicDescription:i['surveyDamagedPartArabicDescription'],
          metParentPart:i['metParentPart'],
        ));

    }
      }
    else {

      throw Exception('Failed to  get counter');
    }

    return parts;
  }


  Future<List<CarParts>> get_Car_Parts(String partSubgroup,String doors,String bodyType,String direction,String description ) async {
    carparts=[];

    var response = await  http.get(Uri.parse(AppUrl.getCarParts+"partSubgroup="+partSubgroup+"&doors="+doors+"&bodyType="+bodyType+"&direction="+direction+"&description="+description)).timeout(Duration(seconds: 50));
    if (response.statusCode == 200) {
      final extractedData = json.decode(response.body)['carPartBeanList'];
      log(extractedData.toString());
      for (var i in extractedData) {
        carparts.add(CarParts(
          partId: i["partId"],
            partDescription: i["partDescription".toString()],
          partArabicDescription: i["partArabicDescription"].toString(),
          relatedCount: i["relatedCount"],
          metCount: i["metCount"],
        ));

      }
    }
    else {

      throw Exception('Failed to  get counter');
    }

    return carparts;
  }
}