import 'package:e_survey/Models/MissionsModel.dart';
import 'package:e_survey/ViewModels/MissionsViewModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ExpertMissions extends GetWidget<MissionsViewModel> {
final controller = Get.put(MissionsViewModel());
final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: FutureBuilder(future:controller.getData(box.read('token').toString())
  ,builder: (context,  AsyncSnapshot snapshot){
    MissonsModel ? data =snapshot.data;
    if (snapshot.hasData) {
return  ListView.builder(
    padding: EdgeInsets.all(10.0),
    itemCount: data!.missions.length,
    itemBuilder: ( context, index) {
    return Card(
      child: Column(children: [

        Text(data.missions[index].accidentNotificationId.toString()),
        Text(data.missions[index].accidentCustomerName.toString())

        
      ],
      ),
    );

}
);
    }
    else{
       return Center(child: CircularProgressIndicator());
    }
  },


),
    );
  }

}
