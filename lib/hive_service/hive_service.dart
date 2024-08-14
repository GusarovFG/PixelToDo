import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todolist/model/item_model.dart';

class HiveService {
  static String boxName = 'toDoBox';

  static Future<Box<ItemModel>> get _box async =>
      await Hive.box(HiveService.boxName);

  static initHive() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(ItemModelAdapter());

    await Hive.openBox<ItemModel>(HiveService.boxName);
  }

  Future<void> addTask(ItemModel task) async {
    var box = await _box;

    await box.add(task);
  }

  Future<List<ItemModel>> getAllTasks() async {
    var box = await _box;
    return box.values.toList();
  }

  Future<ItemModel> getTaskForIndex({required int index}) async {
    var box = await _box;
    return box.values.toList()[index];
  }

  Future<void> deleteTask({required int index}) async {
    var box = await _box;

    await box.deleteAt(index);
  }

  Future<void> updatedComplited(
      {required ItemModel task, required int index}) async {
    var box = await _box;

    task.isComplite = !task.isComplite;
    await box.putAt(index, task);
  }

  Future<void> updateTask({required ItemModel task, required int index}) async {
    var box = await _box;

    await box.putAt(index, task);
  }
}
