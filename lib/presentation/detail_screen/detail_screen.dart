import 'package:flutter/material.dart';
import 'package:pixel_border/pixel_border.dart';
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
  String mainTitle = '';

  final HiveService _hiveService = HiveService();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      titleController.text = widget.task?.title ?? '';
      descriptionController.text = widget.task?.description ?? '';
      mainTitle = 'Edit';
    } else {
      mainTitle = 'New';
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double widthOfScreen = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text(mainTitle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: ShapeDecoration(
                shape: PixelBorder.solid(
                    color: Colors.black,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(4),
                    ),
                    pixelSize: 2),
              ),
              child: TextFormField(
                decoration: InputDecoration(isDense: true),
                controller: titleController,
                maxLength: 20,
              ),
            ),
            Column(
              children: [
                Text(
                  'Title',
                ),
                SizedBox(
                  width: widthOfScreen,
                  height: 120,
                  child: TextField(
                    controller: descriptionController,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        filled: true, hintText: 'Enter a message'),
                  ),
                ),
              ],
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
      ),
    );
  }
}
