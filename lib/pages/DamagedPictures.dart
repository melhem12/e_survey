import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_picker_widget/media_picker_widget.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
class DamagedPictures extends StatefulWidget {
  const DamagedPictures({Key? key}) : super(key: key);

  @override
  _DamagedPicturesState createState() => _DamagedPicturesState();
}

class _DamagedPicturesState extends State<DamagedPictures> {
  static const String pathsListPrefKey = 'pathsList_pref';
  List<Asset> images = <Asset>[];
  List<Asset> temps = <Asset>[];
  List<Media> mediaList = [];
  List<String> paths =[];
  String savedPics = "";
  SharedPreferences? _prefs;
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() => this._prefs = prefs);
      _loadpics();
      // if(savedPics.isNotEmpty) {
      //   log("////////////lllllllllllooooooooooo");
      //   Map m = jsonDecode(savedPics);
      //   m.forEach((k, v) {
      //     mediaList.add(Media());
      //     log(v);
      //   }
      //   );
      //
      // }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: previewList(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => openImagePicker(context),
      ),);


// RaisedButton(
            //   child: Text("Pick images", style: TextStyle(color: Colors.white, fontSize: 20),),
            //   color: Colors.blue,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(16.0)),
            //   onPressed:
            //   pickImages,
            //
            // ),
            // MaterialButton(
            //   color: Colors.red,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(16.0)),
            //   child: const Text(
            //     'Image picker',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   onPressed: () => openImagePicker(context),
            // ),
            // Expanded(
            //   flex: 15,
            //   child:
            //   GridView.count(
            //     crossAxisCount: 3,
            //     children: List.generate(images.length, (index) {
            //       Asset asset = images[index];
            //       return AssetThumb(
            //         asset: asset,
            //         width: 300,
            //         height: 300,
            //       );
            //     }),
            //   ),
            // ),
    //         Expanded(child:  previewList(),
    //         flex: 5,),
    //         // Expanded(
    //         //     flex: 1,
    //         //     child: Container(
    //         //       width: double.infinity,
    //         //       child: ElevatedButton(
    //         //
    //         //         child: Icon(
    //         //           Icons.arrow_back,
    //         //           color: Colors.white,
    //         //           size: 20,
    //         //         ),
    //         //         onPressed: () {
    //         //
    //         //           Navigator.pop(context);
    //         //         },
    //         //         style: ElevatedButton.styleFrom(
    //         //             primary: Colors.blue,
    //         //
    //         //             textStyle: TextStyle(
    //         //                 fontSize: 30,
    //         //                 fontWeight:
    //         //                 FontWeight.bold)),
    //         //       ),
    //         //     )),
    //       ],
    //     ),
    //
    // );
  }
  Future<void> pickImages() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 500,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarTitle: "Damage Parts",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }
    log("identifier..........."+resultList.last.identifier.toString());
    setState(() {
      images = resultList;

    });

// for(var a in images ){
//   File f = await getImageFileFromAssets(a) as File;
//   print("paths............"+f.path);
//   paths.add(f.path);
// }
//     _prefs!.setStringList(pathsListPrefKey, paths);
//     var map1 = Map.fromIterable(images, key: (e) => e.name, value: (e) => e.identifier);
//     String smap=jsonEncode(map1);
//     _prefs!.setString("stringList", smap);
  }



  void _loadpics() {
    setState(() {
      log("hyyyyyyyyyyyy");
      this.savedPics = this._prefs?.getString("stringList") ?? "";
      log(savedPics);
    });
  }


  Future<File> getImageFileFromAssets(Asset asset) async {
    final byteData = await asset.getByteData();

    final tempFile =
    File("${(await getTemporaryDirectory()).path}/${asset.name}");
    final file = await tempFile.writeAsBytes(
      byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
    );

    return file;
  }
  Widget previewList() {
    return SizedBox(
      height: 96,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: List.generate(
            mediaList.length,
                (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 80,
                width: 80,
                // child: Image.memory(
                //   mediaList[index],
                //   fit: BoxFit.cover,
                // )
                child: Image.memory(mediaList[index].thumbnail!,fit: BoxFit.cover,)
                  ,
              ),
            )),
      ),
    );
  }




  void openImagePicker(BuildContext context) {
    // openCamera(onCapture: (image){
    //   setState(()=> mediaList = [image]);
    // });
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MediaPicker(
            mediaList: mediaList,
            onPick: (selectedList) {
              setState(() => mediaList = selectedList);
              Navigator.pop(context);
              log("kkkkkkkkkk");
              log(mediaList[0].file!.path);
              for(var a in mediaList ){
                print("paths............"+a.file!.path);
                paths.add(a.file!.path);
              }
              _prefs!.setStringList(pathsListPrefKey, paths);

              // var map1 = Map.fromIterable(images, key: (e) => e.name, value: (e) => e.identifier);
              // String smap=jsonEncode(map1);
              // _prefs!.setString("stringList", smap);
            },
            onCancel: () => Navigator.pop(context),
            mediaCount: MediaCount.multiple,
            mediaType: MediaType.image,
            decoration: PickerDecoration(
              actionBarPosition: ActionBarPosition.top,
              blurStrength: 2,
              completeText: 'Next',
            ),
          );
        });
  }


}
