import 'package:flutter/material.dart';
import 'package:todolist/presentation/detail_screen/detail_screen.dart';
import 'package:todolist/presentation/mainScreen/list_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoList'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          const ListScreen(),
          Positioned(
              bottom: 20,
              right: 20,
              child: FloatingActionButton.large(onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DetailScreen()));
              }))
        ],
      ),
    );
  }
}
