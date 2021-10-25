import 'package:e_survey/Models/company.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class CompanyService {
  List<Company> companies = [];



  Future<List<Company>> get_data() async {
    try {
      Response response = await get(
          Uri.parse('http://192.168.55.116:8083/api/v1/auth/constant/getDoors'));

      companies = [];
      final extractedData = json.decode(response.body);
       List companiesData = extractedData['companyBeanList'];
      for (var i in companiesData) {
        companies.add(Company(
          companyId: i["companyId"],
          companyName: i['companyName'],
        ));
      }
      print(companies);
      return companies;
    }catch( Exception ){
print('error=$e');
throw Exception(e.toString());
    }
  }
}
