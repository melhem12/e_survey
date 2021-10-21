import 'dart:async';
import 'package:e_survey/Models/company.dart';
import 'package:e_survey/service/companyService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class DataInputPersonalInformation extends StatefulWidget {
  const DataInputPersonalInformation({Key? key}) : super(key: key);


  @override
  _DataInputPersonalInformationState createState() => _DataInputPersonalInformationState();
}

double height =15;
class _DataInputPersonalInformationState extends State<DataInputPersonalInformation> {

   DateTime? _selectedLicenseDate = DateTime.now();
  TextEditingController _textEditingLicenseDateController = TextEditingController();

   DateTime? _selectedLicenseExpiryDate  = DateTime.now();
  TextEditingController _textEditingLicenseExpiryDateController = TextEditingController();

   DateTime? dob  = DateTime.now();
   TextEditingController _textEditingdobController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text("asdsadasdas")),
          body: SingleChildScrollView(
            child:
            Card(
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
                        child: Text("Personal Information",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(height: height,),
                      TextField(
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          isDense: true,
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          hintText: "Enter First Name",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: height,),
                      TextField(
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Father Name',
                          isDense: true,
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          hintText: "Enter Father Name",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                        //  border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: height,),
                      TextField(
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          isDense: true,
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          hintText: "Enter Last Name",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),

                          fillColor: Colors.grey[300],
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: height,),
                      TextField(
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          isDense: true,
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          hintText: "Enter Phone Number",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: height,),
                      Container(
                        child: Column(
                          children: <Widget>[
                            Text("Gender ",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                )),
                         //   DropdownButton<Company>(
                              //isDense: true,
                           //   hint: Text('Choose'),
                         //     value: _selectedValue,
                         //      icon: Icon(Icons.check_circle_outline),
                         //      iconSize: 24,
                         //      elevation: 16,
                         //      style: TextStyle(color: Colors.deepPurple),
                         //      underline: Container(
                         //        height: 2,
                         //        color: Colors.blue[300],
                         //      ),
                         //      onChanged: (Company? newValue) {
                         //        setState(() {
                         //      //    _selectedValue = newValue!;
                         //        });
                         //      },
                              // items:
                              // ser.companies.map<DropdownMenuItem<Company>>((Company value) {
                              //   return DropdownMenuItem<Company>(
                              //     value: value,
                              //     child: Text(value.companyName + ' ' + value.companyId.toString()),
                              //   );
                              // }).toList(),
                       //     ),
                            //dropdownhere ......
                          ],
                        ),
                      ),
                      SizedBox(height: height,),
                      TextField(
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: _textEditingdobController,
                        onTap: () {
                          _selectDate(context,_textEditingdobController,dob!);
                        },
                        decoration: InputDecoration(
                          labelText: 'Date of Birth',
                          isDense: true,
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          hintText: "Enter Date of Birth",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          suffixIcon: Icon(Icons.calendar_today_outlined),
                          fillColor: Colors.grey[300],
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: height,),
                      Container(
                        margin: new EdgeInsets.symmetric(vertical: 10.0),
                        child: Text("License Information",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(height: height,),
                      TextField(
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        decoration: InputDecoration(
                          labelText: 'License Number',
                          isDense: true,
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          hintText: "Enter License Number",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: height,),
                      TextField(
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: _textEditingLicenseDateController,
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        onTap: () {
                          print("asdasdasd");
                          _selectDate(context,_textEditingLicenseDateController,_selectedLicenseDate!);
                        },
                        decoration: InputDecoration(

                          suffixIcon: Icon(Icons.calendar_today_outlined),
                          labelText: 'License Date',
                          isDense: true,
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          hintText: "Enter License Date",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),

                          fillColor: Colors.grey[300],
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: height,),
                      TextField(

                        focusNode: AlwaysDisabledFocusNode(),
                        controller: _textEditingLicenseExpiryDateController,
                        onTap: () {

                          _selectDate(context,_textEditingLicenseExpiryDateController,_selectedLicenseExpiryDate!);
                        },
                        style: TextStyle(
                          color: Color.fromARGB(255, 38, 97, 250),
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.calendar_today_outlined),
                          labelText: 'License Expiry Date',
                          isDense: true,
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          hintText: "Enter License Expiry Date",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 38, 97, 250),
                          ),
                          border: InputBorder.none,
                          fillColor: Colors.grey[300],
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                          ),
                          filled: true,
                        ),
                      ),
                      SizedBox(height: height,),
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
                                  onPressed: () {},
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
                          SizedBox(height: height,),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: ElevatedButton(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 38, 97, 250),
                                      textStyle: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ))
                        ],
                      ),
                    ]
                ),
              ),

            ),
          ),
        )
    );
  }

  _selectDate(BuildContext context,TextEditingController _textEditingController,DateTime _selectedDate) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder:(BuildContext context, Widget?  child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.light(
                primary: Color.fromARGB(255, 38, 97, 250),
                onPrimary: Color.fromARGB(255, 38, 97, 250),
                surface: Colors.blueGrey,
                onSurface: Color.fromARGB(255, 38, 97, 250),
              ),
              dialogBackgroundColor: Colors.white,
            ), child: child!,
           // child: ?child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}