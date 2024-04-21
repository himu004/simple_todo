import 'package:flutter/material.dart';
import 'package:todo_app_andstd/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List of todo tasks

  List toDoList = [
    ["Make Baby", true],
    ["Do Exercise", false],
    ["Do Exercise", true],
    ["Watch Movie", true],
  ];

  // checkbox tapped

  void checkBoxChanged(bool? value, index) {
      setState(() {
        toDoList[index][1] = !toDoList[index][1];
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(
            child: Text("ToDo")
        ),
        backgroundColor: Colors.yellow[500],
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
