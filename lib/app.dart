import 'package:flutter/material.dart';
import 'package:FlutterGalleryApp/screens/feed_screens.dart';
//import 'package:flutter/rendering.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Feed(),
    );
  }
}
