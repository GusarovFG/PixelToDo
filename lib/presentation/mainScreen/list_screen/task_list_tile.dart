import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:todolist/hive_service/hive_service.dart';
import 'package:todolist/model/item_model.dart';

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
      decoration: ShapeDecoration(
        shape: PixelBorder.solid(
            color: Colors.black,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            pixelSize: 2),
      ),
      width: wigthOfScreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.task.title,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Checkbox(
                  shape: PixelBorder.solid(
                      color: Colors.black,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(2),
                      ),
                      pixelSize: 2),
                  side: const BorderSide(width: 1),
                  checkColor: Colors.amber,
                  value: widget.task.isComplite,
                  onChanged: (bool? value) {
                    HiveService().updatedComplited(
                        task: widget.task, index: widget.index);
                  })
            ],
          )
        ],
      ),
    );
  }
}
