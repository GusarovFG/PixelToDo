import 'package:flutter/material.dart';
import 'package:todolist/hive_service/hive_service.dart';
import 'package:todolist/model/item_model.dart';
import 'package:todolist/presentation/pixel_decoration/pixel_decoration.dart';

// ignore: must_be_immutable
class TaskListTile extends StatefulWidget {
  ItemModel task;
  int index;

  TaskListTile({super.key, required this.task, required this.index});

  @override
  State<TaskListTile> createState() => _TaskListTileState();
}

class _TaskListTileState extends State<TaskListTile> {
  @override
  Widget build(BuildContext context) {
    final wigthOfScreen = MediaQuery.sizeOf(context).width;

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: PixelDecoration.shapeDecoration(context),
      width: wigthOfScreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.task.title,
            style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          Checkbox(
            side: BorderSide(
                width: 2, color: Theme.of(context).colorScheme.onPrimary),
            checkColor: Theme.of(context).colorScheme.onPrimary,
            value: widget.task.isComplite,
            onChanged: (bool? value) {
              HiveService()
                  .updatedComplited(task: widget.task, index: widget.index);
            },
          ),
        ],
      ),
    );
  }
}
