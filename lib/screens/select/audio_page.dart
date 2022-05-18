
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:re_mind/screens/select/result_page.dart';

import '../learning/ml_service.dart';
class AudioHomePage extends StatefulWidget{
  @override
  AudioHome createState() => AudioHome();
}

class AudioHome extends State<AudioHomePage> {
  LipService _lipService = LipService();
  AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentTime = "00:00";
  String completeTime = "00:00";
  String filePath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _audioPlayer.onAudioPositionChanged.listen((Duration duration){
      setState(() {
        currentTime = duration.toString().split(".")[0];
      });
    });

    _audioPlayer.onDurationChanged.listen((Duration duration){
      setState(() {
        completeTime = duration.toString().split(".")[0];
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4ECAC),
      body: Stack(
        children: <Widget>[
          // Image.asset("assets/images/photo.png", fit: BoxFit.contain),
          Center(
            child: Text(
            "Select your audio file",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 40,
            margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.7,
                left: MediaQuery.of(context).size.width * 0.1),
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: (){
                    if(isPlaying){
                      _audioPlayer.pause();

                      setState(() {
                        isPlaying = false;
                      });
                    }else{
                      _audioPlayer.resume();

                      setState(() {
                        isPlaying = true;
                      });
                    }

                  },
                )  ,

                SizedBox(width: 16,),

                IconButton(
                  icon: Icon(Icons.stop),
                  onPressed: (){
                    _audioPlayer.stop();

                    setState(() {
                      isPlaying = false;
                    });

                  },
                ),

                Text(currentTime, style: TextStyle(fontWeight: FontWeight.w700),),

                Text(" | "),

                Text(completeTime, style: TextStyle(fontWeight: FontWeight.w300),),
              ],
            ),
          ),

          Container(
            margin:EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.8,
                left: MediaQuery.of(context).size.width * 0.375),
            child: IconButton(
              icon: Icon(Icons.task_alt),
              iconSize: 80,
              onPressed:() async {
                var cartoonImageData = await _lipService.convertCartoonImage(filePath);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Result()),
                );
              },
            ),
          )

          /*
          Container(
            margin:EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.85,
                left: MediaQuery.of(context).size.width * 0.4),
            child: OutlinedButton(
              onPressed: () async {
                var cartoonImageData = await _lipService.convertCartoonImage(filePath);
                Navigator.push(
                  context,

                  MaterialPageRoute(builder: (context) => Result()),
                );
              },
              child: Text("Make video"),
            ),
          )
          */

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFC163EE),
        child: Icon(Icons.audiotrack),
        onPressed: () async {

          FilePickerResult result = await FilePicker.platform.pickFiles();
          if (result != null) {
          //   File file = File(result.files.single.path);
            filePath = await result.files.single.path;
          }
          // else {
          //   // User canceled the picker
          // }

          // String filePath = await FilePicker.getFilePath();
          int status = await _audioPlayer.play(filePath, isLocal: true);

          if (status == 1) {
            setState(() {
              isPlaying = true;
            });
          }
        },
      ),
    );
    throw UnimplementedError();
  }
}