import 'package:e_survey/Models/company.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class updatingInformationService {

  Future<int> update(String carId,String carOwnerFirstName,String carOwnerFamilyName,String carOwnerFatherName,String licenseDate,String licenseExpiryDate,String phoneNumber,String licenseNumber,String userId) async {
    var req_body = new Map();

    if(carId.isNotEmpty && carId !=null) {
      req_body['carId'] = carId;
    }
    if(carOwnerFirstName.isNotEmpty && carOwnerFirstName !=null) {
      req_body['carOwnerFirstName'] = carOwnerFirstName;
    }
    if(carOwnerFamilyName.isNotEmpty && carOwnerFamilyName !=null) {
      req_body['carOwnerFamilyName'] = carOwnerFamilyName;
    }

    if(carOwnerFatherName.isNotEmpty && carOwnerFatherName !=null) {
      req_body['carOwnerFatherName'] = carOwnerFatherName;
    }
    if(licenseDate.isNotEmpty && licenseDate !=null) {
      req_body['licenseDate'] = licenseDate;
    }
    if(licenseExpiryDate.isNotEmpty && licenseExpiryDate !=null) {
      req_body['licenseExpiryDate'] = licenseExpiryDate;
    }
    if(phoneNumber.isNotEmpty && phoneNumber !=null) {
      req_body['phoneNumber'] = phoneNumber;
    }
    if(licenseNumber.isNotEmpty && licenseNumber !=null) {
      req_body['licenseNumber'] = licenseNumber;
    }
    if(userId.isNotEmpty && userId !=null) {
      req_body['userId'] = userId;
    }
    final response = await post(
        Uri.parse('http://127.0.0.1:8081/user/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(req_body));
    if (response.statusCode == 200) {
      var object = json.decode(response.body);
      return  200;
    } else if (response.statusCode == 422) {
      return 422;
    } else {
      return 500;
    }
  }

  Future<int> updateCarInfo(String carId,String carBrandId,String carTradeMarkId,String carVehicleSize,String carBodyType,
      String carDoors,String carYear,String carChasisNumber,String carPlate,String carPolicyNumber,String userId) async {
    var req_body = new Map();

    if(carId.isNotEmpty && carId !=null) {
      req_body['carId'] = carId;
    }

    if(carBrandId.isNotEmpty && carBrandId !=null) {
      req_body['carBrandId'] = carBrandId;
    }

    if(carTradeMarkId.isNotEmpty && carTradeMarkId !=null) {
      req_body['carTradeMarkId'] = carTradeMarkId;
    }
    if(carVehicleSize.isNotEmpty && carVehicleSize !=null) {
      req_body['carVehicleSize'] = carVehicleSize;
    }

    if(carBodyType.isNotEmpty && carBodyType !=null) {
      req_body['carBodyType'] = carBodyType;
    }
    if(carDoors.isNotEmpty && carDoors !=null) {
      req_body['carDoors'] = carDoors;
    }

    if(carYear.isNotEmpty && carYear !=null) {
      req_body['carYear'] =carYear;
    }

    if(carChasisNumber.isNotEmpty && carChasisNumber !=null) {
      req_body['carChasisNumber'] = carChasisNumber;
    }
    if(carPlate.isNotEmpty && carPlate !=null) {
      req_body['carPlate'] = carPlate;
    }
    if(carPolicyNumber.isNotEmpty && carPolicyNumber !=null) {
      req_body['carPolicyNumber'] = carPolicyNumber;
    }
    if(userId.isNotEmpty && userId !=null) {
      req_body['userId'] = userId;
    }


    final response = await post(
        Uri.parse('http://127.0.0.1:8081/user/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(req_body));
    if (response.statusCode == 200) {
      var object = json.decode(response.body);
      return  200;
    } else if (response.statusCode == 422) {
      return 422;
    } else {
      return 500;
    }
  }

  Future<void> getCarTradeMarkList(StringCarBrand) async {
    try {
      Response response = await get(
          Uri.parse('http://localhost:8083/api/v1/esurvey/constant/companiesList'));

      final extractedData = json.decode(response.body);
      // List companiesData = extractedData['companyBeanList'];
      for (var i in extractedData) {
        // companies.add(Company(
        //   companyId: i["carTrademarkId"],
        //   companyName: i['carTrademarkDescription'],
        //));
      }
    }catch(e ){
      print('error=$e');
    }
  }
}
