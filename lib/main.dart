import 'package:flutter/material.dart';
import 'package:flutter_course_chat_app_starter/screens/auth_screen.dart';
import 'package:flutter_course_chat_app_starter/screens/chat_screen.dart';
import 'package:flutter_course_chat_app_starter/screens/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // generated via `flutterfire` CLI

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
