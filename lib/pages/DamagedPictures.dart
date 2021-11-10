import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
class DamagedPictures extends StatefulWidget {
  const DamagedPictures({Key? key}) : super(key: key);

  @override
  _DamagedPicturesState createState() => _DamagedPicturesState();
}

class _DamagedPicturesState extends State<DamagedPictures> {
  List<Asset> images = <Asset>[];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Multi Image Picker - FlutterCorner.com'),
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
            )
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
          actionBarTitle: "FlutterCorner.com",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    setState(() {
      images = resultList;
    });
  }
}
