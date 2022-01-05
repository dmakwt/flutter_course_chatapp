import 'package:flutter/material.dart';
import 'package:flutter_course_chat_app_starter/controller/auth.dart';
import 'package:flutter_course_chat_app_starter/screens/auth_screen.dart';
import 'package:flutter_course_chat_app_starter/screens/chat_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // TODO: initState (Check auth)

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (Auth().isLoggedIn()) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ChatScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => AuthScreen(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/cpes.svg',
              color: Colors.white,
            ),
            Container(height: 80),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
