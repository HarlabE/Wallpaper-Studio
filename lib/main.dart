import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          seedColor: const Color.fromARGB(255, 254, 253, 255),
          primary: const Color(0xffFBB03B),
          secondary: const Color(0xffEC0C43),
        ),
        textTheme: Theme.of(
          context,
        ).textTheme.apply(fontFamily: GoogleFonts.poppins().fontFamily),
      ),
      home: Homepage(isBrowseActive: false, isHomeActive: true),
    );
  }
}
