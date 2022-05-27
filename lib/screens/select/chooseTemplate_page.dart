import 'dart:typed_data';

import 'package:re_mind/screens/select/result_page.dart';
import 'package:flutter/material.dart';
import 'package:re_mind/screens/learning/ml_service.dart';
import 'package:re_mind/screens/select/inputImg_gif_page.dart';


class ChooseTemplate extends StatelessWidget {
  ChooseTemplate({Key, key, this.arguments}) : super(key: key);
  final arguments;
  MLService _mlService = MLService();
  int selectedTemplete;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text('Re:mind'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 0.0),
        child: Column(
          children: [
            Text(
              'Choose the template',
              style: TextStyle(
                  color: Colors.grey[700],
                  //color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0, //간격
            ),

            /**********template1 **********/
            Center(
              //템플릿 1 이미지gif
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/sample1.gif'),
                radius: 70.0,
              ),
            ),
            ElevatedButton(
              //template 1
              onPressed: () {
                selectTem(1);
                // 눌렀을 때 result route로 이동합니다.
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Result()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.orange[400];
                }),
              ),

              child: Text(
                "Template 1.gif",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0, //간격
            ),

            /**********template2 **********/
            Center(
              //템플릿 2임시 이미지gif
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/sample2.gif'),
                radius: 70.0,
              ),
            ),
            ElevatedButton(
              //template 2
              onPressed: () {
                selectTem(2);
                // 눌렀을 때 result route로 이동합니다.
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Result()));
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.orange[400];
                }),
              ),
              child: Text(
                "Template 2.gif",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20.0, //간격
            ),

            /**********template3 **********/
            Center(
              //템플릿 3임시 이미지mp4여야 하는데 gif로 넣기
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/sample3.gif'),
                radius: 70.0,
              ),
            ),
            ElevatedButton(
              //template 3
              onPressed: () {
                //누르면 dialog
                showDialog(
                    context: context,
                    //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        //Dialog Main Title
                        title: Column(
                          children: <Widget>[
                            new Text("Input voice"),
                          ],
                        ),
                        //
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: IconButton(
                                icon: Icon(Icons.record_voice_over),
                                onPressed: () {}, //넣기
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          new TextButton(
                            child: new Text("Ok"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  return Colors.orange[400];
                }),
              ),
              child: Text(
                "Template 3.mp4",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),

            //각 템플릿 버튼을 눌렀을 때
            //1. gif의 경우 ->결과 route로 가도록 만들기
            //2. mp4인 경우 pop창으로 음성mp4넣게 하기 ->결과 route로 가도록 만들기

            /*RaisedButton(
              child: Text('Move Splash route'),
              onPressed: () {
                // 눌렀을 때 두 번째 route로 이동합니다.
                Navigator.pop(context);
              },
            ),*/
          ],
        ),
      ),
    );
  }

  void selectTem(int num) async{
    selectedTemplete = num;
    var cartoonImageData = await _mlService.convertCartoonImage(arguments.arg, selectedTemplete);
    // if (cartoonImageData == null) {
    //   //         cartoonImage = null;
    //   //       } else {
    //   //         cartoonImage = cartoonImageData;
    //   //       }
  }
  // void selectImage() async {
  //   setState(() {
  //     selectedTemplete =
  //
  //   });
  //
  //   var imageData = await _filePickerService.imageFilePickAsBytes();
  //
  //   if (imageData != null) {
  //     setState(() {
  //       defaultImage = imageData;
  //     });
  //
  //     var cartoonImageData = await _mlService.convertCartoonImage(imageData);
  //
  //     setState(() {
  //       if (cartoonImageData == null) {
  //         cartoonImage = null;
  //       } else {
  //         cartoonImage = cartoonImageData;
  //       }
  //     });
  //   } else {
  //     setState(() {
  //       defaultImage = null;
  //       cartoonImage = null;
  //     });
  //   }
  // }

}
