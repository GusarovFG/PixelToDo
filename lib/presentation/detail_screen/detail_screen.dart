import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/hive_service/hive_service.dart';
import 'package:todolist/model/item_model.dart';
import 'package:todolist/presentation/detail_screen/detail_alert.dart';
import 'package:todolist/presentation/pixel_decoration/pixel_decoration.dart';

class DetailScreen extends StatefulWidget {
  final ItemModel? task;
  final int? index;

  const DetailScreen({super.key, this.task, this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String mainTitle = '';
  bool buttonIsEnable = true;

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

    final systemBrightness = PlatformDispatcher.instance.platformBrightness;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: systemBrightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark),
        title: Text(mainTitle),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Column(
              children: [
                const Text('TITLE'),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: PixelDecoration.shapeDecoration(context),
                  width: widthOfScreen,
                  height: 50,
                  child: TextField(
                    controller: titleController,
                    maxLines: null,
                    expands: true,
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      filled: false,
                      hintText: 'Enter a title',
                      border: InputBorder.none,
                    ),
                    cursorColor: Theme.of(context).colorScheme.onPrimary,
                    cursorWidth: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                const Text(
                  'DESCRIPTION',
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: PixelDecoration.shapeDecoration(context),
                  width: widthOfScreen,
                  height: 200,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    color: Theme.of(context).colorScheme.primary,
                    child: TextFormField(
                      controller: descriptionController,
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        filled: false,
                        hintText: 'Enter a description',
                        border: InputBorder.none,
                      ),
                      cursorColor: Theme.of(context).colorScheme.onPrimary,
                      cursorWidth: 10,
                    ),
                  ),
                ),
              ],
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: widthOfScreen / 4,
              decoration: PixelDecoration.shapeDecoration(context),
              child: MaterialButton(
                enableFeedback: true,
                textColor: Theme.of(context).colorScheme.onPrimary,
                onPressed: () {
                  if (titleController.text.isNotEmpty) {
                    final task = ItemModel(
                        isComplite: false,
                        title: titleController.text,
                        description: descriptionController.text);

                    widget.task == null
                        ? _hiveService.addTask(task)
                        : _hiveService.updateTask(
                            task: task, index: widget.index!);

                    Navigator.pop(context);
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext contex) {
                          return DetailAlert();
                        });
                  }
                },
                child: const Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
