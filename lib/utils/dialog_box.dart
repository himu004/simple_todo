import 'package:flutter/material.dart';
import 'package:todo_app_andstd/utils/my_button.dart';

class DialogBox extends StatelessWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;


  DialogBox({super.key, this.controller, required this.onSave,required this.onCancel,  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
        content: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            // Get User Input
            Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Add a new task",
                ),
              ),
            ),
          //   buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              //   Save Button
                MyButton(text: "Save", onPressed: onSave),
              SizedBox(width: 8,),
              //   Cancel button
                MyButton(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],),
        ),
    );
  }
}
