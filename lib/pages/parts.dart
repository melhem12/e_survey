
import 'dart:developer';

import 'package:e_survey/Models/CarParts.dart';
import 'package:e_survey/Models/direction.dart';
import 'package:e_survey/Models/partGroup.dart';
import 'package:e_survey/args/CarImputArgs.dart';
import 'package:e_survey/service/PartMetApi.dart';
import 'package:e_survey/service/constantsApi.dart';
import 'package:flutter/material.dart';

import 'dataInputPersonalInformation.dart';


class parts extends StatefulWidget {
  const parts({Key? key}) : super(key: key);

  @override
  _partsState createState() => _partsState();
}

class _partsState extends State<parts> {
    String partDesc='';
    late Future<List<PartGroup>> futurePartGroup;
    late Future<List<Direction>> futureDirection;
   late  Future <List<CarParts>> futureCarParts= Future.value([]);
    late PartGroup _partGroup= PartGroup(code: '', description: '');
    late Direction _direction =Direction(code: '', description: '');

    @override
    void initState() {
      futurePartGroup=ConstantsApi().get_part_group();
    futureDirection=ConstantsApi().getDirection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
final args= ModalRoute.of(context)!.settings.arguments as CarImputArgs;
    return MaterialApp(
        title: ' Car Parts',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(title: Text(" Car Parts")),
          body:
          Column(
            children: [
              Expanded(
                flex: 5,
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
                          Expanded(
                            flex: 2,
                            child:  TextField(
                            onChanged: (String value){
                              partDesc=value;
                              log(value);
                            },
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                            decoration: InputDecoration(
                              labelStyle: TextStyle(
                                color: Colors.blue,
                              ),
                              labelText: 'Part Description',
                              isDense: true,
                              fillColor: Colors.grey[300],
                              filled: true,
                              hintStyle: TextStyle(
                                color: Colors.blue,
                              ),
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                BorderSide(  color: Colors.blue,

                                ),
                              ),
                            ),
                          ),
                          ),
                          Expanded(flex:1,child:   Text("Side",
                              style: TextStyle(
                             //   fontSize: 14,
                                color: Colors.grey,
                              )),),
                          Expanded(
                            flex: 2,
                            child:

                          StatefulBuilder(
                              builder: (BuildContext context,
                                  StateSetter setState) {
                                return FutureBuilder<List<PartGroup>>(
                                    future: futurePartGroup,
                                    builder: (BuildContext context,
                                        AsyncSnapshot<
                                            List<PartGroup>> snapshot) {
                                      if (!snapshot.hasData)
                                        return CircularProgressIndicator();
                                      return DropdownButton<PartGroup>(
                                        items: snapshot.data!
                                            .map((grp) =>
                                            DropdownMenuItem<PartGroup>(
                                              child:
                                              Text(grp.description),
                                              value: grp,
                                            ))
                                            .toList(),
                                        onChanged: (PartGroup? value) {
                                          setState(() => _partGroup = value!);
                                        },
                                        isExpanded: true,
                                        //   value: _brands==null?Brands(carBrandId: "carBrandId", carBrandDescription: "carBrandDescription"):_brands,
                                        value: _partGroup.code.isEmpty
                                            ? snapshot.data![0]
                                            : snapshot.data![
                                        snapshot.data!.indexOf(_partGroup)],
                                        hint: Text("Select part Group type"),);
                                    });
                              }),

                          ),  Expanded(flex:1,child:   Text("Position",
                              style: TextStyle(
                               // fontSize: 14,
                                color: Colors.grey,
                              )),),
                          Expanded(
                            flex: 2,
                            child:

                            StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setState) {
                                  return FutureBuilder<List<Direction>>(
                                      future: futureDirection,
                                      builder: (BuildContext context,
                                          AsyncSnapshot<
                                              List<Direction>> snapshot) {
                                        if (!snapshot.hasData)
                                          return CircularProgressIndicator();
                                        return DropdownButton<Direction>(
                                          items: snapshot.data!
                                              .map((dir) =>
                                              DropdownMenuItem<Direction>(
                                                child:
                                                Text(dir.description),
                                                value: dir,
                                              ))
                                              .toList(),
                                          onChanged: (Direction? value) {
                                            setState(() => _direction = value!);
                                          },
                                          isExpanded: true,
                                          //   value: _brands==null?Brands(carBrandId: "carBrandId", carBrandDescription: "carBrandDescription"):_brands,
                                          value: _direction.code.isEmpty
                                              ? snapshot.data![0]
                                              : snapshot.data![
                                          snapshot.data!.indexOf(_direction)],
                                          hint: Text("Select direction"),);
                                      });
                                }),

                          ),
                          Expanded(flex: 2,
                              child: FlatButton(
                                minWidth: double.infinity,
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              onPressed: () async {
                               // showLoaderDialog(context);


                                  if(_partGroup.code.isEmpty){
                                 List<PartGroup> pg= await futurePartGroup;
                                 setState(() {
                                   _partGroup=pg[0];
                                 });
                                  }
                                  if(_direction.code.isEmpty){
                                    List<Direction> di= await futureDirection;
                                    setState(() {
                                      _direction=di[0];
                                    });
                                  }
                                futureCarParts = PartMetApi().get_Car_Parts(_partGroup.code, args.doors, args.bodyType, _direction.code, partDesc);
                                setState(() {

                                });
                               // Navigator.pop(context);

                              },
                              child: Text(
                                "Filter",
                                style: TextStyle(color: Colors.white, fontSize: 20),

                              ))
                          )





                        ]
    ),


    ),
    ),
              ),
              Expanded(
                  flex: 6,
                  child:
                  FutureBuilder(
                  future: futureCarParts,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {

                      return ListView.builder(
                        padding: EdgeInsets.all(10.0),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                              onTap: () {

                              },
                              child: Card(
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data[index].partArabicDescription,
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.0,
                                      ),


                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            snapshot.data[index].partDescription
                                            ,
                                            style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          snapshot.data[index].metCount >0
                                              ? Text("")
                                              : FlatButton(
                                            color: Colors.blue,
                                            onPressed: () {




                                            },
                                            child: Text('MET',
                                            style: TextStyle(color: Colors.white, fontSize: 16)),
                                          ),
                                        ],
                                      ),

                                      // SizedBox(
                                      //   height: 5.0,
                                      // ),
                                    ],
                                  ),
                                ),
                                elevation: 5.0,
                                shadowColor: Colors.black54,
                              ));
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return CircularProgressIndicator();
                    }
                  })




              ),
              Expanded(
                flex: 1,
                child:
                Container(
                  width: double.infinity,
                  child: ElevatedButton(

                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),

                    onPressed: () {
                      Navigator.pop(context);
                    },

                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight:
                            FontWeight.bold)),
                  ),
                )
            )

            ],
          ),
    ),

    );
  }
    showLoaderDialog(BuildContext context){
      AlertDialog alert=AlertDialog(
        content: new Row(
          children: [
            CircularProgressIndicator(),
            Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
          ],),
      );
      showDialog(barrierDismissible: false,
        context:context,
        builder:(BuildContext context){
          return alert;
        },
      );
    }
}
