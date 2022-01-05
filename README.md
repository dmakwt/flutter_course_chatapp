# flutter_course_chat_app_starter


## Getting Started


### Firebase installations

  1- Open `Firestore` </br> 
  2- Click `create database` </br> 
  3- Choose `test mode`, then click `Next` </br> 
  4 - Choose `Cloud Firestore location` </br> 
  5 - Click `Enable` </br> 


#### Setting up Android

  1- Click `Click Project Overview` </br> 
  2- Then click the `Android symbol` </br> 
  3- Add `com.cpeskw.chatapp` in the package name field and `CPES` in the App nickname field </br> 
  4- Then click `Register` app </br> 
  5- Then click `Download google-services.json` </br> 
  6- Click `Next` </br> 
  7- Click `Next` again and then `Continue to console` </br> 
  8- Then move `google-services.json` from the `download` location to your project’s `android/app` folder </br> 
  
  9-  Open `android/build.gradle` </br> 
  10- Then add the `classpath 'com.google.gms:google-services:4.3.10'` at the end of the list in the `dependencies` </br> 
  
  11- Open `android/app/build.gradle` </br> 
  12- add `apply plugin: 'com.google.gms.google-services'` after the `apply from` </br>
  
  
#### Setting up iOS
  1- Click `Click Project Overview` </br> 
  2- Click `Add app`
  3- Then click the `iOS symbol` </br> 
  4- Add `com.cpeskw.chatapp` in the package name field and `CPES` in the App nickname field </br> 
  5- Then click `Register` app </br> 
  6- Download GoogleService-info.plist </br> 
  7- Click `Next` </br> 
  8- Click `Next` again and then `Continue to console` </br> 
  9- Move the `GoogleService-info.plist` file to the `ios/Runner` folder </br> 
  
  10- Then open `ios/Runner.xcworkspace` in `Xcode` </br> 
  11- Add `GoogleService-info.plist` file to the `Runner` folder (Make sure you have `Copy items if needed` checked) </br> 
  
  
#### Packages
  1- Add these packages inside `pubspec.yaml` file
  ```yaml
  firebase_core: ^1.10.6
  cloud_firestore: ^3.1.5
  ```
  
  
  2- Replace `main` method with
  ```dart
  Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}
  ```
  
  
  #### MessageTile widget
  ```dart
  import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageTile extends StatelessWidget {
  final String email;
  final String text;
  final DateTime date;

  MessageTile({
    required this.email,
    required this.text,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              '$text',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  '$email',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  timeago.format(date),
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```





  
  
  
  
  
  

