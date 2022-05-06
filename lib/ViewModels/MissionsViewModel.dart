import 'dart:convert';

import 'package:e_survey/Models/MissionsModel.dart';
import 'package:e_survey/utility/app_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MissionsViewModel extends GetxController{
  getData(String token) async{
    final url =Uri.parse(AppUrl.missions);
    http.Response response= await   http.get(url

      ,  headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'}
    ) ;
    if(response.statusCode==200){
      try{
        return MissonsModel.fromJson(jsonDecode(response.body));

      }
      catch(e){
        Get.snackbar('can not get data', e.toString());
      }

    }
  }
}