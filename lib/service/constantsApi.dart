import 'dart:developer';

import 'package:e_survey/Models/body_type.dart';
import 'package:e_survey/Models/brand.dart';
import 'package:e_survey/Models/car_trade_mark.dart';
import 'package:e_survey/Models/description.dart';
import 'package:e_survey/Models/direction.dart';
import 'package:e_survey/Models/doors.dart';
import 'package:e_survey/Models/gender.dart';
import 'package:e_survey/Models/partGroup.dart';
import 'package:e_survey/Models/vehicle_size.dart';
import 'package:e_survey/utility/app_url.dart';
import 'package:http/http.dart';
import 'dart:convert';
List<Gender> genders=[];
List<Doors> doors=[];
List<BodyType> body_types=[];
List<VehicleSize> vehicleSizes=[];
List<Brands> brands=[];
List<PartGroup> partGroups=[];
List<Direction> directions=[];
List<Description> descriptions=[];
List<CarTradeMark> carTradeMarks=[];

class ConstantsApi{
  Future<List<Gender>> get_genders() async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.gendersList));

      genders = [];
      final extractedData = json.decode(response.body);
      if(extractedData != null) {
        List companiesData = extractedData['genderBeanList'];
        for (var i in companiesData) {
          genders.add(Gender(
            genderId: i["genderId"],
            genderDescription: i['genderDescription'],
          ));
        }
        //    print(companies);

      }

    }catch( e ){
      print('error=$e');
      throw Exception(e.toString());
    }

    return genders;
  }
  Future<List<Doors>> get_doors() async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.doors));

      doors = [];
      final extractedData = json.decode(response.body);
      if(extractedData != null) {
        List doorsData = extractedData['doorsBeanList'];
        for (var i in doorsData) {
          doors.add(Doors(
            code: i["code"],
            description: i['description'],
          ));
        }
        //    print(companies);

      }

    }catch( e ){
      print('error=$e');
      throw Exception(e.toString());
    }

    return doors;
  }




  Future<List<BodyType>> get_body_types() async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.bodyType));

      doors = [];
      final extractedData = json.decode(response.body);
      if(extractedData != null) {
        List bodyTypeData = extractedData['bodyTypeBeanList'];
        for (var i in bodyTypeData) {
          body_types.add(BodyType(
            code: i["code"],
            description: i['description'],
          ));
        }
        //    print(companies);

      }

    }catch( e ){
      print('error=$e');
      throw Exception(e.toString());
    }

    return body_types;
  }



  Future<List<VehicleSize>> get_vehicle_size() async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.vehicleSize));

      vehicleSizes = [];
      final extractedData = json.decode(response.body);
      if(extractedData != null) {
        List data = extractedData['vehicleSizeBeanList'];
        for (var i in data) {
          vehicleSizes.add(VehicleSize(
            code: i["code"],
            description: i['description'],
          ));
        }
        //    print(companies);

      }

    }catch( e ){
      print('error=$e');
      throw Exception(e.toString());
    }

    return vehicleSizes;
  }



  Future<List<Brands>> get_brand() async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.carBrand));

      vehicleSizes = [];
      final extractedData = json.decode(response.body);
      if(extractedData != null) {
        List data = extractedData['carBrandBeanList'];
        for (var i in data) {
          brands.add(Brands(
            carBrandId: i["carBrandId"],
            carBrandDescription: i['carBrandDescription'],
          ));
        }
        //    print(companies);

      }

    }catch( e ){
      print('error=$e');
      throw Exception(e.toString());
    }

    return brands;
  }


  Future<List<Direction>> getDirection() async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.directions));

      directions = [];
      final extractedData = json.decode(response.body);
      if(extractedData != null) {
        List data = extractedData['directionsListResponse'];
        for (var i in data) {
          directions.add(Direction(
            code: i["code"],
            description: i['description'],
          ));
        }
        //    print(companies);

      }

    }catch( e ){
      print('error=$e');
      throw Exception(e.toString());
    }

    return directions;
  }

  Future<List<Description>> getDescription() async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.description));

      descriptions = [];
      final extractedData = json.decode(response.body);
      if(extractedData != null) {
        List bodyTypeData = extractedData['litigationDamageLovBeanList'];
        for (var i in bodyTypeData) {
          descriptions.add(Description(
            code: i["code"],
            description: i['description'],
          ));
        }
        log(descriptions[0].description);
        //    print(companies);

      }

    }catch( e ){
      print('error=$e');
      throw Exception(e.toString());
    }

    return descriptions;
  }



  Future<List<PartGroup>> get_part_group() async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.partGroup));

      partGroups = [];
      final extractedData = json.decode(response.body);
      if(extractedData != null) {
        List data = extractedData['partGroupBeanList'];
        for (var i in data) {
          partGroups.add(PartGroup(
            code: i["code"],
            description: i['description'],
          ));
        }
        //    print(companies);

      }

    }catch( e ){
      print('error=$e');
      throw Exception(e.toString());
    }

    return partGroups;
  }

  Future<List<CarTradeMark>> getCarTradeMarkList(String carBrandId) async {
    try {
      Response response = await get(
          Uri.parse(AppUrl.carTrademarkList+"?carBrandId="+carBrandId));
      carTradeMarks=[];
      final extractedData = json.decode(response.body);
      List data = extractedData['carTrademarkBeanList'];
      for (var i in data) {
        carTradeMarks.add(CarTradeMark(
          carTrademarkId: i["carTrademarkId"],
          carTrademarkDescription: i['carTrademarkDescription'],
        ));
      }
    }catch(e ){
      print('error=$e');
      throw Exception(e.toString());
    }
    return carTradeMarks;
  }


}