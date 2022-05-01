import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:re_mind/constants.dart';
import 'package:re_mind/screens/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key, this.user}) : super(key: key);
  static const routeName = '/home';
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      backgroundColor: Color(0xFFF6EEAE),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Color(0xFFF6EEAE),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/back.svg"),
        onPressed: () {},
      )
      /*
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/profile', arguments: user);
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],

       */
    );
  }
}
