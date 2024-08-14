import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pixel_border/pixel_border.dart';
import 'package:todolist/hive_service/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/model/item_model.dart';
import 'package:todolist/presentation/detail_screen/detail_screen.dart';
import 'package:todolist/presentation/mainScreen/list_screen/task_list_tile.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<ItemModel>(HiveService.boxName).listenable(),
      builder: (context, Box<ItemModel> box, widget) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(box.values.toList()[index].title),
                  background: Container(
                    decoration: ShapeDecoration(
                      color: Colors.red.shade300,
                      shape: PixelBorder.solid(
                          color: Colors.red,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          pixelSize: 2),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'DELETE',
                          style: TextStyle(fontFamily: 'pixel', fontSize: 20),
                        ),
                        Text('DELETE',
                            style:
                                TextStyle(fontFamily: 'pixel', fontSize: 20)),
                      ],
                    ),
                  ),
                  onDismissed: (_) {
                    HiveService().deleteTask(index: index);
                  },
                  child: GestureDetector(
                    child: TaskListTile(
                      task: box.values.toList()[index],
                      index: index,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            task: box.values.toList()[index],
                            index: index,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                    height: 10,
                  ),
              itemCount: box.length),
        );
      },
    );
  }
}
