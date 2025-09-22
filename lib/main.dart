import 'package:basic_website/landing.dart';
import 'package:flutter/material.dart';

void main() => runApp(BasicWebApp());

class BasicWebApp extends StatelessWidget {
  const BasicWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Webapp',
      home: LandingPage(),
    );
  }
}
