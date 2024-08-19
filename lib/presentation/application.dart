import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todolist/presentation/mainScreen/mainScreen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = PlatformDispatcher.instance.platformBrightness;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: brightness == Brightness.dark
              ? DarkColorScheme.darkScheme
              : LightColorScheme.lightScheme,
          fontFamily: 'pixel'),
      home: const MainScreen(),
    );
  }
}

class DarkColorScheme {
  static ColorScheme darkScheme = const ColorScheme.dark().copyWith(
    brightness: Brightness.dark,
    primary: const Color.fromRGBO(41, 43, 48, 1),
    onPrimary: const Color.fromRGBO(207, 171, 74, 1),
    secondary: const Color.fromARGB(255, 41, 43, 48),
    onSecondary: const Color.fromRGBO(207, 171, 74, 1),
    error: const Color.fromARGB(255, 41, 43, 48),
    onError: const Color.fromRGBO(207, 171, 74, 1),
    surface: const Color.fromARGB(255, 41, 43, 48),
    onSurface: const Color.fromRGBO(207, 171, 74, 1),
  );
}

class LightColorScheme {
  static ColorScheme lightScheme = const ColorScheme.light().copyWith(
      brightness: Brightness.light,
      primary: const Color.fromRGBO(207, 171, 74, 1),
      onPrimary: const Color.fromRGBO(41, 43, 48, 1),
      secondary: const Color.fromRGBO(207, 171, 74, 1),
      onSecondary: const Color.fromARGB(255, 41, 43, 48),
      error: const Color.fromRGBO(207, 171, 74, 1),
      onError: const Color.fromARGB(255, 41, 43, 48),
      surface: const Color.fromRGBO(207, 171, 74, 1),
      onSurface: const Color.fromARGB(255, 41, 43, 48));
}
