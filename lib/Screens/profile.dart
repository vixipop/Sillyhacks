import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sillyhacks/Screens/cam.dart';
import 'package:sillyhacks/constants.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Profile extends StatefulWidget {
//  final String picture;
  final String imageUrl;

  Profile(this.imageUrl);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String dir;
  String imgUrl = "";
  bool downloading = false;
  VideoPlayerController _controller;
  var progressString = "";

  void getPermission() async {
    print("getPermission");
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

//  Future<void> downloadFile() async {
//    Dio dio = Dio();
//
//    try {
//       dir = await ExtStorage.getExternalStoragePublicDirectory(
//          ExtStorage.DIRECTORY_DOWNLOADS);
//      await dio.download(imgUrl, "$dir/butterfly.mp4",
//          onReceiveProgress: (rec, total) {
//        print("Rec: $rec , Total: $total");
//
//        setState(() {
//          downloading = true;
//          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
//        });
//      });
//    } catch (e) {
//      print(e);
//    }
//
//    setState(() {
//      downloading = false;
//      progressString = "Completed";
//    });
//    print("Download completed");
//  }

  @override
  void initState() {
    super.initState();
    getPermission();
    imgUrl = widget.imageUrl;
//    downloadFile();
    _controller = VideoPlayerController.network(imgUrl)
      ..initialize().then((_) {
        setState(() {});
      })..play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlueBG,
      appBar: AppBar(
          backgroundColor: kGreen,
          elevation: 0,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
            size: 40,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
//              Container(
////                width: 50,
////                height: 50,
////                decoration: BoxDecoration(
////                  border: Border.all(color: Colors.blue, width: 4.0),
////                  shape: BoxShape.circle,
////                  image: DecorationImage(
////                    fit: BoxFit.fill,
////                    image: NetworkImage(widget.picture ?? ''),
////                  ),
////                ),
////              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: BoxDecoration(
                    color: kGreen,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
              ),
              SizedBox(
                height: 20,
              ),
              PlayCard(
                Center(
                  child: _controller.value.initialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                              child: VideoPlayer(_controller)),
                        )
                      : Container(),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      height: 1,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Center(
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 2)),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyCameraScreen()));
                          },
                          icon: Icon(Icons.camera_alt),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PlayCard extends StatelessWidget {
  Widget child;

  PlayCard(this.child);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 0.9 * MediaQuery.of(context).size.width,
        height: 0.5 * MediaQuery.of(context).size.height,
        child: child,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}

//RaisedButton(
//onPressed: () {
//logoutAction();
//},
//child: Text('Logout'),
//),

//"${dir.path}/demo.mp4"
