import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late List<String> list;

  @override
  void initState() {
    list = [
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
      'adasdad',
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: list.length),
    );
  }
}
