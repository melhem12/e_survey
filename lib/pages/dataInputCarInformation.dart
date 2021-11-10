import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:e_survey/Models/body_type.dart';
import 'package:e_survey/Models/brand.dart';
import 'package:e_survey/Models/car_trade_mark.dart';
import 'package:e_survey/Models/company.dart';
import 'package:e_survey/Models/doors.dart';
import 'package:e_survey/Models/vehicle_size.dart';
import 'package:e_survey/args/CarImputArgs.dart';
import 'package:e_survey/args/claimsListArgs.dart';
import 'package:e_survey/args/personalInfoArgs.dart';
import 'package:e_survey/pages/requiredDocuments.dart';
import 'package:e_survey/service/constantsApi.dart';
import 'package:e_survey/service/updatingInformationService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataInputCarInformation extends StatefulWidget {
  String? carTrademarkId;
  String? doors;
  String? bodyType;
  String? vehicleSize;
  String? carId;
  String? notificationId;
  String? vehicleOwnerName;
  String? carOwnerMaidenName;
  String? accidentLocation;
  String? shapeID;
  String? brandTradeMark;
  String? pasNumber;
  String? reportedDate;
  String? modelYear;
  String? brandId;
  String? claimStatus;
  String? claimNumber;
  String? chasisNumber;
  String? insurerCode;
  String? plateNumber;
  String? vehicleNumber;
  String? policyNumber;

  static const routeName = '/DataInputCarInformation';

  DataInputCarInformation(
      this.carTrademarkId,
      this.doors,
      this.bodyType,
      this.vehicleSize,
      this.carId,
      this.notificationId,
      this.vehicleOwnerName,
      this.carOwnerMaidenName,
      this.accidentLocation,
      this.shapeID,
      this.brandTradeMark,
      this.pasNumber,
      this.reportedDate,
      this.modelYear,
      this.brandId,
      this.claimStatus,
      this.claimNumber,
      this.chasisNumber,
      this.insurerCode,
      this.plateNumber,
      this.vehicleNumber,
      this.policyNumber);

  DataInputCarInformation.n();

  @override
  _DataInputCarInformationState createState() =>

      _DataInputCarInformationState();
}

class _DataInputCarInformationState extends State<DataInputCarInformation> {
  late Future<List<Brands>> futureBrand;
  late Future<List<CarTradeMark>> futureTrademark;
  late Future<List<Doors>> futureDoors;
  late Future<List<VehicleSize>> futureVSize;
  late Future<List<BodyType>> futureBodyType;


  static const String userIDPrefKey = 'userId_pref';
  String savedUid = "";
  late BodyType _bodyType = BodyType(code: '', description: '');
  late VehicleSize _vehicleSize = VehicleSize(code: '', description: '');
  late Doors _doors = Doors(code: '', description: '');
  late Brands _brands = Brands(carBrandId: '', carBrandDescription: '');
  late CarTradeMark _carTradeMark =
  CarTradeMark(carTrademarkId: '', carTrademarkDescription: '');
  double height = 15;
  final yearController = TextEditingController();
  final policyNumController = TextEditingController();
  final plateController = TextEditingController();
  final chasisController = TextEditingController();
  SharedPreferences? _prefs;

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() => this._prefs = prefs);
      _loadUserId();
    });
    futureBrand = ConstantsApi().get_brand();
    futureBodyType = ConstantsApi().get_body_types();
    futureDoors = ConstantsApi().get_doors();
    futureVSize = ConstantsApi().get_vehicle_size();
    yearController
      ..text = widget.modelYear.toString() ==
          "null" ||
          widget.modelYear
              .toString()
              .isEmpty
          ? ''
          : widget.modelYear.toString();
    policyNumController
      ..text = widget.policyNumber.toString() ==
          "null" ||
          widget.policyNumber
              .toString()
              .isEmpty
          ? ''
          : widget.policyNumber.toString();
    plateController
      ..text = widget.plateNumber.toString() ==
          "null" ||
          widget.pasNumber
              .toString()
              .isEmpty
          ? ''
          : widget.plateNumber.toString();
    chasisController
      ..text = (widget.chasisNumber ==
          "null" ||
          widget.chasisNumber!.isEmpty
          ? ''
          : widget.chasisNumber)!;
    if (widget.brandId!.isNotEmpty || widget.brandId != "null") {
      getBrandObject();
      futureTrademark =
          ConstantsApi().getCarTradeMarkList(widget.brandId.toString());

      if (widget.carTrademarkId!.isNotEmpty ||
          widget.carTrademarkId != "null") {
        getTradeMarkObject();
      }
    }
    if (widget.bodyType!.isNotEmpty ||
        widget.bodyType != "null") {
      getBodyObject();
    }
    if (widget.vehicleSize!.isNotEmpty ||
        widget.vehicleSize != "null") {
      getVehSizeObject();
    }
    if (widget.doors!.isNotEmpty ||
        widget.doors != "null") {
      getDoorsObject();
    }


    super.initState();
  }

  getBrandObject() async {
    List<Brands> brand = await futureBrand as List<Brands>;
    for (var i in brand) {
      if (widget.brandId == i.carBrandId) {
        setState(() {
          _brands = i;
          log("/////zzzzzzz///");
        });
        break;
      }
    }
  }


  getDoorsObject() async {
    List<Doors> doors = await futureDoors as List<Doors>;
    for (var i in doors) {
      if (widget.doors == i.code) {
        setState(() {
          _doors = i;
          log("/////zzzzzzz///");
        });
        break;
      }
    }
  }

  getBodyObject() async {
    List<BodyType> bodyList = await futureBodyType as List<BodyType>;
    for (var i in bodyList) {
      if (widget.bodyType == i.code) {
        setState(() {
          _bodyType = i;
          log("/////zzzzzzz///");
        });
        break;
      }
    }
  }

  getVehSizeObject() async {
    List<VehicleSize> sizeList = await futureVSize as List<VehicleSize>;
    for (var i in sizeList) {
      if (widget.vehicleSize == i.code) {
        setState(() {
          _vehicleSize = i;
          log("/////zzzzzzz///");
        });
        break;
      }
    }
  }


  getTradeMarkObject() async {
    List<CarTradeMark> cartrades = await futureTrademark as List<CarTradeMark>;
    for (var i in cartrades) {
      if (widget.carTrademarkId == i.carTrademarkId) {
        setState(() {
          _carTradeMark = i;
          log("/////wwww///");
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //   final args = ModalRoute.of(context)!.settings.arguments as personalInfoArgs;


    return MaterialApp(
      title: 'Car info',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Car Info')),
        backgroundColor: Colors.white,
        // appBar: AppBar(title: Text("asdsadasdas")),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: new EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("Vehicle Information",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          )),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Make Name ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              )),
                          StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return FutureBuilder<List<Brands>>(
                                future: futureBrand,
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Brands>> snapshot) {
                                  if (!snapshot.hasData)
                                    return CircularProgressIndicator();
                                  return DropdownButton<Brands>(
                                    items: snapshot.data!
                                        .map((brand) =>
                                        DropdownMenuItem<Brands>(
                                          enabled: widget.vehicleNumber == "0"
                                              ? false
                                              : true,
                                          child: Text(
                                              brand.carBrandDescription),
                                          value: brand,
                                        ))
                                        .toList(),
                                    onChanged: (Brands? value) {
                                      log(value!.carBrandDescription);
                                      this.setState(() {
                                        futureTrademark = ConstantsApi()
                                            .getCarTradeMarkList(
                                            value.carBrandId);
                                      });
                                      setState(() => _brands = value);
                                      _carTradeMark = CarTradeMark(
                                          carTrademarkId: '',
                                          carTrademarkDescription: '');
                                    },
                                    isExpanded: true,
                                    //   value: _brands==null?Brands(carBrandId: "carBrandId", carBrandDescription: "carBrandDescription"):_brands,
                                    value: _brands.carBrandId.isEmpty
                                        ? null
                                        : snapshot.data![
                                    snapshot.data!.indexOf(_brands)],
                                    hint: new Text("Select Brand"),
                                    // hint: Text(_gender.genderDescription.isEmpty?"select gender":_gender.genderDescription
                                    // ),
                                  );
                                });
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Model Name ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    ),
                    StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return FutureBuilder<List<CarTradeMark>>(
                              future: futureTrademark,

                              builder: (BuildContext context,
                                  AsyncSnapshot<List<CarTradeMark>> snapshot) {
                                if (!snapshot.hasData)
                                  return CircularProgressIndicator();
                                return DropdownButton<CarTradeMark>(

                                  items: snapshot.data!
                                      .map((mark) =>
                                      DropdownMenuItem<CarTradeMark>(
                                        enabled: widget.vehicleNumber == "0"
                                            ? false
                                            : true,

                                        child:
                                        Text(mark.carTrademarkDescription),
                                        value: mark,
                                      ))
                                      .toList(),
                                  onChanged: (CarTradeMark? value) {
                                    setState(() => _carTradeMark = value!);
                                  },
                                  isExpanded: true,
                                  //   value: _brands==null?Brands(carBrandId: "carBrandId", carBrandDescription: "carBrandDescription"):_brands,
                                  value: _carTradeMark.carTrademarkId.isEmpty ||
                                      _carTradeMark == null
                                      ? null
                                      : snapshot.data![
                                  snapshot.data!.indexOf(_carTradeMark)],
                                  hint: new Text("Select TradeMark"),
                                );
                              });
                        }),

                    SizedBox(
                      height: height,
                    ),
                    TextField(
                      enabled: widget.vehicleNumber == "0"
                          ? false
                          : true,
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 97, 250),
                      ),
                      keyboardType: TextInputType.number,
                      controller: yearController,


                      decoration: InputDecoration(
                        labelText: 'Year',
                        isDense: true,
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        hintText: "Enter Year",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        fillColor: Colors.grey[300],
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 38, 97, 250)),
                        ),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    TextField(
                      enabled: widget.vehicleNumber == "0"
                          ? false
                          : true,
                      controller: chasisController,
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 97, 250),
                      ),
                      decoration: InputDecoration(
                        labelText: 'Chasis Number',
                        isDense: true,
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        hintText: "Enter Chasis Number",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        fillColor: Colors.grey[300],
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 38, 97, 250)),
                        ),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    TextField(
                      enabled: widget.vehicleNumber == "0"
                          ? false
                          : true,
                      controller: plateController,
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 97, 250),
                      ),
                      decoration: InputDecoration(
                        labelText: 'Plate Number',
                        isDense: true,
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        hintText: "Enter Plate Number",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        fillColor: Colors.grey[300],
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 38, 97, 250)),
                        ),
                        filled: true,
                      ),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Vehicle Size ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              )),

                          StatefulBuilder(
                              builder: (BuildContext context,
                                  StateSetter setState) {
                                return FutureBuilder<List<VehicleSize>>(
                                    future: futureVSize,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<
                                            List<VehicleSize>> snapshot) {
                                      if (!snapshot.hasData)
                                        return CircularProgressIndicator();
                                      return DropdownButton<VehicleSize>(
                                        items: snapshot.data!
                                            .map((size) =>
                                            DropdownMenuItem<VehicleSize>(
                                              child:
                                              Text(size.description),
                                              value: size,
                                            ))
                                            .toList(),
                                        onChanged: (VehicleSize? value) {
                                          setState(() => _vehicleSize = value!);
                                        },
                                        isExpanded: true,
                                        value: _vehicleSize.code.isEmpty
                                            ? null
                                            : snapshot.data![
                                        snapshot.data!.indexOf(_vehicleSize)],
                                        hint: new Text("Select Vehicle Size"),);
                                    });
                              }),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Body Type ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              )),

                          StatefulBuilder(
                              builder: (BuildContext context,
                                  StateSetter setState) {
                                return FutureBuilder<List<BodyType>>(
                                    future: futureBodyType,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<
                                            List<BodyType>> snapshot) {
                                      if (!snapshot.hasData)
                                        return CircularProgressIndicator();
                                      return DropdownButton<BodyType>(
                                        items: snapshot.data!
                                            .map((type) =>
                                            DropdownMenuItem<BodyType>(
                                              child:
                                              Text(type.description),
                                              value: type,
                                            ))
                                            .toList(),
                                        onChanged: (BodyType? value) {
                                          setState(() => _bodyType = value!);
                                        },
                                        isExpanded: true,
                                        //   value: _brands==null?Brands(carBrandId: "carBrandId", carBrandDescription: "carBrandDescription"):_brands,
                                        value: _bodyType.code.isEmpty
                                            ? null
                                            : snapshot.data![
                                        snapshot.data!.indexOf(_bodyType)],
                                        hint: new Text("Select body type"),);
                                    });
                              }),


                        ],
                      ),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text("Doors ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              )),

                          StatefulBuilder(
                              builder: (BuildContext context,
                                  StateSetter setState) {
                                return FutureBuilder<List<Doors>>(
                                    future: futureDoors,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<List<Doors>> snapshot) {
                                      if (!snapshot.hasData)
                                        return CircularProgressIndicator();
                                      return DropdownButton<Doors>(
                                        items: snapshot.data!
                                            .map((door) =>
                                            DropdownMenuItem<Doors>(
                                              child:
                                              Text(door.description),
                                              value: door,
                                            ))
                                            .toList(),
                                        onChanged: (Doors? value) {
                                          setState(() => _doors = value!);
                                        },
                                        isExpanded: true,
                                        value: _doors.code.isEmpty
                                            ? null
                                            : snapshot.data![
                                        snapshot.data!.indexOf(_doors)],
                                        hint: new Text("Select doors"),);
                                    });
                              }),


                        ],
                      ),
                    ),
                    Container(
                      margin: new EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("Insurance Information",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          )),
                    ),
                    TextField(
                      enabled: widget.vehicleNumber == "0"
                          ? false
                          : true,
                      controller: policyNumController,
                      style: TextStyle(
                        color: Color.fromARGB(255, 38, 97, 250),
                      ),
                      decoration: InputDecoration(
                        labelText: 'Policy Number',
                        isDense: true,
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        hintText: "Policy Number",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        fillColor: Colors.grey[300],
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 38, 97, 250)),
                        ),
                        filled: true,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Container(
                              child: ElevatedButton(
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () async {

                                  bool updated = await update(widget.carId.toString(),_brands.carBrandId,_carTradeMark.carTrademarkId,_vehicleSize.code,_bodyType.code,_doors.code,yearController.text,chasisController.text,plateController.text,policyNumController.text,savedUid);

                                  if(updated) {
                                    ScaffoldMessenger.of(
                                        context)
                                        .showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                        Colors.blue,
                                        content: Text("updated car info"),

                                        //action: SnackBarAction(label: 'OK', onPressed: () {}),
                                      ),
                                    );

                                    Navigator.pop(context);

                                  }else{
                                    ScaffoldMessenger.of(
                                        context)
                                        .showSnackBar(
                                      SnackBar(
                                        backgroundColor:
                                        Colors.red,
                                        content: Text("updated failed"),

                                      ),
                                    );

                                  }


                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 38, 97, 250),
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: height,
                        ),

                        Expanded(
                            flex: 1,
                            child: Container(
                              child: ElevatedButton(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                onPressed: () async {

    bool updated = await update(widget.carId.toString(),_brands.carBrandId,_carTradeMark.carTrademarkId,_vehicleSize.code,_bodyType.code,_doors.code,yearController.text,chasisController.text,plateController.text,policyNumController.text,savedUid);

    if(updated) {
      ScaffoldMessenger.of(
          context)
          .showSnackBar(
        SnackBar(
          backgroundColor:
          Colors.blue,
          content: Text("updated car info"),

        ),
      );

    Navigator.push(context,
    MaterialPageRoute(builder: (context) => RequiredDocuments(),settings: RouteSettings(
      arguments:CarImputArgs (carId: widget.carId.toString(),bodyType: _bodyType.code,doors: _doors.code)),),);

    }else{
      ScaffoldMessenger.of(
          context)
          .showSnackBar(
        SnackBar(
          backgroundColor:
          Colors.red,
          content: Text("updated failed"),

        ),
      );

    }

                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 38, 97, 250),
                                    textStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loadUserId() {
    setState(() {
      this.savedUid = this._prefs?.getString(userIDPrefKey) ?? "";
    });
  }

Future<bool> update(String carId,String carBrandId,String carTradeMarkId,String carVehicleSize,String carBodyType,
    String carDoors,String carYear,String carChasisNumber,String carPlate,String carPolicyNumber,String userId ) async {
  bool updated  = await updatingInformationService().updateCarInfo(  carId, carBrandId, carTradeMarkId, carVehicleSize, carBodyType, carDoors, carYear, carChasisNumber, carPlate, carPolicyNumber, userId);
  return updated;
}
}
