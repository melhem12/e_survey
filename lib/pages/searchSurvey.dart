import 'package:e_survey/Models/company.dart';
import 'package:flutter/material.dart';
import 'package:e_survey/service/companyService.dart';
class SearchSurvey extends StatefulWidget {


  @override
  _SearchSurveyState createState() => _SearchSurveyState();

}

class _SearchSurveyState extends State<SearchSurvey> {

double height=15;
  Company selectedCompany = Company( companyId:0,companyName:"");
  List<Company> d =[];
 late String selectedValue;
List<Company> Companies=[];
  CompanyService s = CompanyService();
String _value = '';
late List<DropdownMenuItem<int>> _menuItems;

_asyncMethod() async {
  s.get_data() ;
   Companies=s.companies;
}

  @override
  void initState()  {
   _asyncMethod();
print(Companies);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(title: Text("asdsadasdas")),
          body: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: new EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("Survey-Search",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                        )),
                  ),
            DropdownButton(
              value: _value,
              icon: Icon(Icons.keyboard_arrow_down),
              items:Companies.map((Company items) {
                return DropdownMenuItem(
                    value: items.companyId,
                    child: Text(items.companyName)
                );
              }
              ).toList(),
              onChanged: (newValue){
                setState(() {
                  _value = newValue.toString();
                });
              },
            ),
                  TextField(
                    style: TextStyle(
                      color: Color.fromARGB(255, 38, 97, 250),
                    ),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 38, 97, 250),
                      ),
                      labelText: 'Densed TextField',
                      isDense: true,
                      hintText: "Enter a message",
                      fillColor: Colors.grey[300],
                      filled: true,
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 38, 97, 250),
                      ),
                      border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                        BorderSide(color: Color.fromARGB(255, 38, 97, 250)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  Container(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // margin: EdgeInsets.symmetric(horizontal: 0.5),
                        // margin: EdgeInsets.all(5.0),
                        Expanded(
                          flex: 6,
                          child: TextField(
                            style: TextStyle(
                              color: Color.fromARGB(255, 38, 97, 250),
                            ),
                            decoration: InputDecoration(
                              labelText: 'Densed TextField',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 38, 97, 250),
                              ),
                              isDense: true,
                              hintText: "Enter a message",
                              fillColor: Colors.grey[300],
                              filled: true,
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 38, 97, 250),
                              ),
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 38, 97, 250)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          flex: 6,
                          child: TextField(
                            style: TextStyle(
                              color: Color.fromARGB(255, 38, 97, 250),
                            ),
                            decoration: InputDecoration(
                              labelText: 'Densed TextField',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 38, 97, 250),
                              ),
                              isDense: true,
                              hintText: "Enter a message",
                              fillColor: Colors.grey[300],
                              filled: true,
                              hintStyle: TextStyle(
                                color: Color.fromARGB(255, 38, 97, 250),
                              ),
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 38, 97, 250)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height,
                  ),
                  TextField(
                    style: TextStyle(
                      color: Color.fromARGB(255, 38, 97, 250),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Densed TextField',
                      isDense: true,
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 38, 97, 250),
                      ),
                      hintText: "Enter a message",
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
                  SizedBox(
                    height: height,
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
                              onPressed: () {print(s);},
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
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: ElevatedButton(
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {print(d[1].companyName.toString());},
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
          )),
    );;
  }

}

