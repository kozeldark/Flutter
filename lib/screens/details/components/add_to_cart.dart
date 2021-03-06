import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:re_mind/models/Product.dart';
import 'package:re_mind/screens/select/inputImg_gif_page.dart';

import '../../../constants.dart';
import '../../learning/ml_service.dart';
import '../../select/inputImg_mp4_page.dart';

// 템플릿 선택 페이지

// 데이터 전달(템플릿 번호)에 사용할 클래스
class Arguments {
  int arg;   // 전달에 사용할 데이터
  ReturnValue returnValue; //반환때 사용할 클래스
  Arguments({this.arg: null, this.returnValue});
}

class ReturnValue {
  String result;
  ReturnValue({this.result});
}

class AddToCart extends StatelessWidget {
  AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(


        children: <Widget>[
          /*
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              ),
            ),

            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                color: product.color,
              ),
              onPressed: () {},
            ),
          ),
          */
          SizedBox(height: 100), //"CHOOSE" 버튼과 gif이미지 사이의 간격구현

          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: product.color,
                onPressed: () {
                  Fluttertoast.showToast(msg: this.product.id.toString());
                  String check = this.product.type.toString();

                  if (check == 'GIF') {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => RemindPageGif(this.product
                                .id)));
                  }
                  else {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => RemindPage(this.product
                                .id)));
                  }
                },
                child: Text(
                  "Choose".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}