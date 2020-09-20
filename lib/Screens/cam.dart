import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MyCameraScreen extends StatefulWidget {
  @override
  _MyCameraScreenState createState() => _MyCameraScreenState();
}

class _MyCameraScreenState extends State<MyCameraScreen> {
 
PickedFile imageURI;
final ImagePicker _picker=ImagePicker();

Future getImageFromGallery(bool isCamera) async{
  var image=await _picker.getImage(source:(isCamera==true)?ImageSource.camera:ImageSource.gallery);
  setState((){
    imageURI=image;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SillyCam'),
      ),
      body: Container(
        child:Column(
          children:<Widget>[
            SizedBox(
              height: 70,
            ),
            Container(
              child: imageURI==null?Image.network("https://media1.tenor.com/images/78d21171ff21c08eb6b19a56b09d37a4/tenor.gif?itemid=14148230",height: 400,width:500,): Image.file(File(imageURI.path)),
            ),
          ],
        )
      ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: (){
                getImageFromGallery(true);
              },
              child: Icon(
                Icons.camera,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: (){
                getImageFromGallery(false);
              },
              child: Icon(
                Icons.photo_album,
              ),
            ),
            
          ],
        ),
    );
  }
}


