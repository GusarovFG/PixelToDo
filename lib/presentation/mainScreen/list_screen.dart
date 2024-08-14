import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist/hive_service/hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/model/item_model.dart';

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
        return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(box.values.toList()[index].title),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            itemCount: box.length);
      },
    );
  }
}
