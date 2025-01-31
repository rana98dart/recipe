import 'package:flutter/material.dart';
import 'package:recipes/pages/screen_recipe.dart';

void main() {
  runApp(const recipepage());
}

class recipepage extends StatefulWidget {
  const recipepage({super.key});

  @override
  State<recipepage> createState() => _recipepageState();
}

class _recipepageState extends State<recipepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: screenrecipe(),
      debugShowCheckedModeBanner: false,
    );
  }
}