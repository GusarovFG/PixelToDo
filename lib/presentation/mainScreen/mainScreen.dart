import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:todolist/presentation/detail_screen/detail_screen.dart';
import 'package:todolist/presentation/mainScreen/list_screen/list_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final systemBrightness = PlatformDispatcher.instance.platformBrightness;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: systemBrightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark),
        title: const Text(
          'ToDoList',
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const ListScreen(),
            Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                    shape: PixelBorder.solid(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                        pixelSize: 2),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Transform.scale(
                      scale: 2,
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailScreen(
                            task: null,
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
