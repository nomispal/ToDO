import 'package:flutter/material.dart';
import 'package:todo/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox ({
     super.key,
     required this.controller,
     required this.onCancel,
     required this.onSave
   });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepOrangeAccent[100],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // ger user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task"
              ),
            ),
            SizedBox(width: 5,),
            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(
                    text: "Cancel",
                    onPressed: (){
                      onCancel();
                    }
                ),
                SizedBox(width: 7),
                // cancel button
                MyButton(
                    text: "Save",
                    onPressed: (){
                      onSave();
                    }
                )
              ],
            ),
          ],
        ),
      ),

    );
  }
}
