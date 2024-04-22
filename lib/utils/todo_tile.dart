import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

   TodoTile({super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 20),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          children: [
            // Check Box
            Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,

            ),
            // Text
            Text(
                taskName,
              style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough :  TextDecoration.none),
            ),
          ],
        ),

      ),
    );
  }
}
