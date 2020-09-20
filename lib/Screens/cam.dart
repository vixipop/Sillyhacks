import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

class MyCameraScreen extends StatefulWidget {
  @override
  _MyCameraScreenState createState() => _MyCameraScreenState();
}

class _MyCameraScreenState extends State<MyCameraScreen> {
PickedFile imageURI;
final ImagePicker _picker=ImagePicker();

Future getImageFromeGallery(bool isCamera) async{
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
                getImageFromeGallery(true);
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
                getImageFromeGallery(false);
              },
              child: Icon(
                Icons.photo_album,
              ),
            ),
            FloatingActionButton(
              onPressed: (){
                uploadImageToServer(File(imageURI.path));
              },
              child: Icon(
                Icons.upload_file,
              ),
            ),
            FloatingActionButton(
              onPressed: (){
                getImageFromeGallery(false);
              },
              child: Icon(
                Icons.mail,
              ),
            ),
          ],
        ),
    );
  }
}


uploadImageToServer(File imageFile)async
  {
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('https://2aa4744cc5a4.ngrok.io/api'));
    request.files.add(
    await http.MultipartFile.fromPath(
      'image',
      imageFile.path,
      contentType: MediaType('application', 'png'),
    ),
  );
  http.StreamedResponse r = await request.send();
  String rstring = (await r.stream.transform(utf8.decoder).join());
  Map<String, dynamic> rjson = jsonDecode(rstring);
  String imageUrl = rjson["file_url"];
  print(imageUrl);
}
