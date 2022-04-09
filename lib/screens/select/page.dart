import 'dart:typed_data';

import 'package:shop_app/screens/learning/file_picker_service.dart';
import 'package:shop_app/screens/learning/ml_service.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class CartoonPage extends StatefulWidget {
  @override
  _CartoonPageState createState() => _CartoonPageState();
}

class _CartoonPageState extends State<CartoonPage> {
  MLService _mlService = MLService();
  FilePickerService _filePickerService = FilePickerService();

  Uint8List defaultImage;
  Uint8List cartoonImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Re:mind', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.image),
            onPressed: selectImage,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 0.0),
        child: Column(
          children: [
            Center(
              child: Text(
                '1. Input your Image',
                style: TextStyle(
                  //color: Colors.white,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 40.0, //간격
            ),
            LoadingImage(defaultImage), //처음 Input 이미지
            SizedBox(
              height: 20.0, //간격
            ),
            Icon(
              Icons.keyboard_arrow_down,
              size: 50,
            ),
            Text(
              '2. Choose the template',
              style: TextStyle(
                //color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0, //간격
            ),
            Center(
              //템플릿 1 이미지gif
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/sample1.gif'),
                radius: 60.0,
              ),
            ),

            TextButton(
              //template 1
              onPressed: () {},
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
              child: Text(
                "Template 1.gif",
                style: TextStyle(
                    backgroundColor: Colors.blue[100],
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              //템플릿 2임시 이미지gif
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/sample1.gif'),
                radius: 60.0,
              ),
            ),
            TextButton(
              //template 2
              onPressed: () {},
              child: Text(
                "Template 2.gif",
                style: TextStyle(
                    backgroundColor: Colors.blue[100],
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold),
              ),
            ),

            TextButton(
              //template 3
              onPressed: () {},
              child: Text(
                "Template 3.mp4",
                style: TextStyle(
                    backgroundColor: Colors.blue[100],
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              //아래화살표
              Icons.keyboard_arrow_down,
              size: 50,
            ),
            Text(
              '3. Result (gif)',
              style: TextStyle(
                //color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40.0, //간격
            ),
            LoadingImage(cartoonImage),
            // LoadingMp4(),
            // VideoApp(),
            SizedBox(
              height: 20.0, //간격
            ),
          ],
        ),
      ),
    );
  }

  Widget LoadingMp4(){
    VideoPlayerController _videoPlayerController;
    @override
    void initState() {
      super.initState();
      _videoPlayerController = VideoPlayerController.asset(
          'assets/demo.mp4')
        ..initialize().then((_) {
          setState(() {});
          _videoPlayerController.play();
        });
    }

    @override
    void dispose() {
      _videoPlayerController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Center(
        child: VideoPlayer(_videoPlayerController),
      );
    }
  }

  Widget LoadingImage(Uint8List imageData) {
    if (imageData == null) {
      return Center(
        child: Container(
          child: Text(
            'No Image',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      );
    } else if (imageData.length == 0) {
      return Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 5,
            ),
            Text('Loading'),
          ],
        ),
      );
    } else {
      return Image.memory(
        imageData,
        fit: BoxFit.fitWidth,
      );
    }
  }

  void selectImage() async {
    // setState(() {
    //   defaultImage = Uint8List(0);
    //   cartoonImage = Uint8List(0);
    // });
    //
    // var imageData = await _filePickerService.imageFilePickAsBytes();
    //
    // if (imageData != null) {
    //   setState(() {
    //     defaultImage = imageData;
    //   });
    //
    //   var cartoonImageData = await _mlService.convertCartoonImage(imageData);
    //
    //   setState(() {
    //     if (cartoonImageData == null) {
    //       cartoonImage = null;
    //     } else {
    //       cartoonImage = cartoonImageData;
    //     }
    //   });
    // } else {
    //   setState(() {
    //     defaultImage = null;
    //     cartoonImage = null;
    //   });
    // }
  }
}


