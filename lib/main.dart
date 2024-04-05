
import 'package:festival_app/view/screen/edit/edit_screen.dart';
import 'package:festival_app/view/screen/home/home_screen.dart';
import 'package:festival_app/view/screen/splash_screen.dart';
import 'package:festival_app/view/screen/templet/templet_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => splashscreen(),
      'home':(context) => home_screen(),
      'edit':(context) => edit_screen(),
      'templet':(context) => EditScreen(),
    },
  ));
}
