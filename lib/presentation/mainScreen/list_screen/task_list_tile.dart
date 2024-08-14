import 'package:flutter/material.dart';
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
    final heightOfScreen = MediaQuery.sizeOf(context).height;
    final wigthOfScreen = MediaQuery.sizeOf(context).width;

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white60,
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
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
              Transform.scale(
                scale: 1.5,
                child: Checkbox(
                    shape: CircleBorder(eccentricity: 1, side: BorderSide.none),
                    side: BorderSide(width: 2),
                    checkColor: Colors.amber,
                    value: widget.task.isComplite,
                    onChanged: (bool? value) {
                      HiveService().updatedComplited(
                          task: widget.task, index: widget.index);
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}
