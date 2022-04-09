import 'dart:typed_data';

import 'package:shop_app/screens/select/result_page.dart';
import 'package:shop_app/screens/learning/file_picker_service.dart';
import 'package:shop_app/screens/learning/ml_service.dart';
import 'package:flutter/material.dart';

class RemindPage extends StatefulWidget {
  @override
  _RemindPageState createState() => _RemindPageState();
}
class ReturnValue{
  String result;
  ReturnValue({this.result});
}
// 데이터 전달에 사용할 클래스
class Arguments {
  Uint8List arg;   // 전달에 사용할 데이터
  ReturnValue returnValue; //반환때 사용할 클래스
  Arguments({this.arg: null, this.returnValue});
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
        backgroundColor: Colors.orange,
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
                'Input your Image',
                style: TextStyle(
                    color: Colors.grey[700],
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
              height: 80.0, //간격
            ),
            IconButton(
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 80,
              color: Colors.amberAccent[700],
              onPressed: () {
                // 눌렀을 때 Result route로 이동합니다.
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Result()));
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

      // var cartoonImageData = await _mlService.convertCartoonImage(imageData);
      //
      // setState(() {
      //   if (cartoonImageData == null) {
      //     cartoonImage = null;
      //   } else {
      //     cartoonImage = cartoonImageData;
      //   }
      // });
    } else {
      setState(() {
        defaultImage = null;
        cartoonImage = null;
      });
    }
  }
}
