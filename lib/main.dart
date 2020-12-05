import 'package:firebase2_app/console.dart';
import 'package:firebase2_app/home.dart';
import 'package:firebase2_app/login.dart';
import 'package:firebase2_app/mysplash1.dart';
import 'package:firebase2_app/reg.dart';
import 'package:firebase2_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "mysplash",
    routes: {
      'home': (context) => MyHome(),
      'reg': (context) => MyReg(),
      'login': (context) => MyLogin(),
      'console': (context) => MyApp(),
      'mysplash': (context) => MySplash(),
      'mysplash1': (context) => MySplash1(),
    },
    debugShowCheckedModeBanner: false,
  ));
}