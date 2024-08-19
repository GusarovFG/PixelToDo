import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:todolist/presentation/detail_screen/detail_screen.dart';
import 'package:todolist/presentation/mainScreen/list_screen/list_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        color: Colors.black,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(14),
                        ),
                        pixelSize: 2),
                    backgroundColor: Colors.white,
                    child: Transform.scale(
                      scale: 2,
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
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
