import 'package:flutter/material.dart';
import 'package:todolist/hive_service/hive_service.dart';
import 'package:todolist/model/item_model.dart';

class DetailScreen extends StatefulWidget {
  final ItemModel? task;
  final int? index;

  DetailScreen({super.key, this.task, this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final HiveService _hiveService = HiveService();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      titleController.text = widget.task?.title ?? '';
      descriptionController.text = widget.task?.description ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
          ),
          TextField(
            controller: descriptionController,
          ),
          MaterialButton(
            onPressed: () {
              final task = ItemModel(
                  isComplite: false,
                  title: titleController.text,
                  description: descriptionController.text);

              widget.task == null
                  ? _hiveService.addTask(task)
                  : _hiveService.updateTask(task: task, index: widget.index!);

              Navigator.pop(context);
            },
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
