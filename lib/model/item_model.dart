import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 0)
class ItemModel {
  ItemModel(
      {required this.isComplite,
      required this.title,
      required this.description});

  @HiveField(0)
  bool isComplite;

  @HiveField(1)
  String title;

  @HiveField(2)
  String description;
}
