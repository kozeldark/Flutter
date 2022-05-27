import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:io';

class MLService {
  Dio dio = Dio();

  // ml server
  Future<Uint8List> convertCartoonImage (Uint8List imageData, int templeteData) async {
    try {
      var encodedData = await compute(base64Encode, imageData);
//      Response response = await dio.post('https://gachon-gan-app.herokuapp.com//v1/image/convert_cartoon',
//        data: {
//          'image': encodedData
//        }
//      );
      Response response = await dio.post('http://10.0.2.2:5000/face_swap',
          data: {
            'image': encodedData,
            'templete': templeteData
          }
      );

      String result = response.data;
      return compute(base64Decode, result);
    } catch (e) {
      return null;
    }
  }
}

class LipService {
  Dio dio = Dio();

  // ml server
  Future<Uint8List> convertCartoonImage(String audioPath) async {
    try {
      File file = new File(audioPath);
      Response response = await dio.post('http://10.0.2.2:5000/lip',
          data: {
            'audio': file
          }
      );

      String result = response.data;
      return compute(base64Decode, result);
    } catch (e) {
      return null;
    }
  }
}
