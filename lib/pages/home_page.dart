import 'package:flutter/material.dart';
import 'package:todo_app_andstd/utils/dialog_box.dart';
import 'package:todo_app_andstd/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  // List of todo tasks
  List toDoList = [

  ];

  // checkbox tapped
  void checkBoxChanged(bool? value, index) {
      setState(() {
        toDoList[index][1] = !toDoList[index][1];
      });
  }

  // Save a new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // Create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
              controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        }
    );
  }
  // Delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.remove(index);
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
      floatingActionButton: FloatingActionButton(
        onPressed:  createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.yellow[600],
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask,
          );
        },
      ),
    );
  }
}
