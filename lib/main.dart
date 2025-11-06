import 'package:flutter/material.dart';
import 'package:wallpaper_studio/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Color(0xffFBB03B),
          secondary: Color(0xffEC0C43),
        ),
      ),
      home: Homepage(isBrowseActive: false, isHomeActive: true),
    );
  }
}
