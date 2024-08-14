import 'package:flutter/material.dart';
import 'package:todolist/model/item_model.dart';

// ignore: must_be_immutable
class TaskListTile extends StatelessWidget {
  ItemModel task;

  TaskListTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final wightOfScreen = MediaQuery.sizeOf(context).width;

    return Container(
      alignment: Alignment.center,
      height: wightOfScreen / 8,
      child: Text(task.title),
    );
  }
}
