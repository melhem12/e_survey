import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/services.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DamagedPictures extends StatefulWidget {
  const DamagedPictures({Key? key}) : super(key: key);

  @override
  _DamagedPicturesState createState() => _DamagedPicturesState();
}

class _DamagedPicturesState extends State<DamagedPictures> {
  static const String pathsListPrefKey = 'pathsList_pref';
  List<Asset> images = <Asset>[];
  List<Asset> temps = <Asset>[];
  List<String> paths =[];
  String savedPics = "";
  SharedPreferences? _prefs;
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() => this._prefs = prefs);
      _loadpics();
      if(savedPics.isNotEmpty) {
        log("////////////lllllllllllooooooooooo");
        Map m = jsonDecode(savedPics);
        m.forEach((k, v) => images.add(Asset(v, k, 300, 300)));
      }
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Damage Parts'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Pick images", style: TextStyle(color: Colors.white, fontSize: 20),),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              onPressed: pickImages,
            ),
            Expanded(
              flex: 15,
              child: GridView.count(
                crossAxisCount: 3,
                children: List.generate(images.length, (index) {
                  Asset asset = images[index];
                  return AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  );
                }),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(

                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
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
                )),
          ],
        ),
      ),
    );
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

    setState(() {
      images = resultList;
    });
for(var a in images ){
  File f = await getImageFileFromAssets(a) as File;

  print(f.path);
  paths.add(f.path);
}
    _prefs!.setStringList(pathsListPrefKey, paths);

    var map1 = Map.fromIterable(images, key: (e) => e.name, value: (e) => e.identifier);
    String smap=jsonEncode(map1);

    _prefs!.setString("stringList", smap);






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



}
