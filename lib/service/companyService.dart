import 'package:e_survey/Models/company.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class CompanyService {
  List<Company> companies = [];



  Future<void> get_data() async {
    try {
      Response response = await get(
          Uri.parse('http://localhost:8083/api/v1/esurvey/constant/companiesList'));

      companies = [];
      final extractedData = json.decode(response.body);
      // List companiesData = extractedData['companyBeanList'];
      for (var i in extractedData) {
        companies.add(Company(
          companyId: i["companyId"],
          companyName: i['companyName'],
        ));
      }
    }catch(e ){
print('error=$e');
    }
  }
}
