import 'dart:typed_data';

import 'package:re_mind/screens/select/audio_page.dart';
import 'package:re_mind/screens/select/result_page.dart';
import 'package:re_mind/screens/learning/file_picker_service.dart';
import 'package:re_mind/screens/learning/ml_service.dart';
import 'package:flutter/material.dart';

// 이미지 넣는 페이지
class RemindPage extends StatefulWidget {
  final int arguments;
  const RemindPage(this.arguments);

  @override
  _RemindPageState createState() => _RemindPageState();
}


class _RemindPageState extends State<RemindPage> {
  MLService _mlService = MLService();
  FilePickerService _filePickerService = FilePickerService();

  Uint8List defaultImage;
  Uint8List cartoonImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE5C2F5),
        title: Text('Re:mind', style: TextStyle(color: Color(0xFF474745))),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          /*
          IconButton(
            icon: Icon(Icons.image),
            onPressed: selectImage,
          )
           */
        ],
      ),
      backgroundColor: Color(0xFFF5EDAD),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 0.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'Input your Image',
                style: TextStyle(
                    color: Colors.grey[700],
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 60.0, //간격
            ),
            LoadingImage(defaultImage), //처음 Input 이미지
            SizedBox(
              height: 60.0, //간격
            ),

            IconButton(
              icon: Icon(Icons.image),
              onPressed: selectImage,
              iconSize: 80,
              color: Color(0xFFC163EE),
            ),

            IconButton(
              icon: Icon(Icons.library_music),
              iconSize: 80,
              color: Color(0xFFC163EE),
              onPressed: () {
                // 눌렀을 때 Result route로 이동합니다.
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (context) => Result()));
                  MaterialPageRoute(builder: (context) =>
                      AudioHomePage(defaultImage, widget.arguments)),
                );
              },
            ),
            /*
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
            SizedBox(
              height: 20.0, //간격
            ),*/
          ],
        ),
      ),
    );
  }

  Widget LoadingImage(Uint8List imageData) {
    if (imageData == null) {
      return Center(
        child: Container(
          child: Text(
            'No Image',
            style: TextStyle(
              color: Colors.grey[700],
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
    setState(() {
      defaultImage = Uint8List(0);
      cartoonImage = Uint8List(0);
    });

    var imageData = await _filePickerService.imageFilePickAsBytes();

    if (imageData != null) {
      setState(() {
        defaultImage = imageData;
      });
    }
  }
}