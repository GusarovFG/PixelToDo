import 'package:flutter/material.dart';
import 'package:todolist/hive_service/hive_service.dart';
import 'package:todolist/presentation/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initHive();

  runApp(const Application());
}
