import 'package:flutter/material.dart';
import 'package:re_mind/constants.dart';
import 'package:re_mind/screens/home/home_screen.dart';
import 'package:re_mind/screens/login/signup.dart';
import 'package:re_mind/screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:re_mind/screens/login/splash.dart';
import 'package:re_mind/screens/login/auth.dart';
import 'package:re_mind/screens/home/home_screen.dart';
import 'package:re_mind/screens/login/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

    Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "XXX", // Your apiKey
        appId: "XXX", // Your appId
        messagingSenderId: "XXX", // Your messagingSenderId
        projectId: "XXX", // Your projectId
      ),
    );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter & Firebase',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: SplashPage.routeName,
      routes: {
        AuthPage.routeName: (context) => AuthPage(),
        SignInPage.routeName: (context) => SignInPage(),
        SignUpPage.routeName: (context) => SignUpPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeScreen.routeName: {
            return MaterialPageRoute(
                builder: (context) => HomeScreen()
            );
          } break;

          case ProfilePage.routeName: {
            return MaterialPageRoute(
                builder: (context) => ProfilePage(user: settings.arguments)
            );
          } break;

          default: {
            return MaterialPageRoute(
                builder: (context) => SplashPage()
            );
          } break;
        }
      },
    );
  }
}