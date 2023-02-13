import 'package:flutter/material.dart';
import 'package:tutor_mundi/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    title: "Tutor Mundi",
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
    },
  ));
}
