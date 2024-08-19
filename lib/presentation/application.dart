import 'package:flutter/material.dart';
import 'package:todolist/presentation/mainScreen/mainScreen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'pixel'),
      home: const MainScreen(),
    );
  }
}
