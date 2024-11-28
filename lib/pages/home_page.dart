import 'package:flutter/material.dart';
import 'package:todo/components/dialog_box.dart';
import 'package:todo/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  // text controller
  final _mycontroller = TextEditingController();
  // list of todo tasks
  List todoList = [
  ];

  // checkbox was tapped
  void checkboxChanged(bool? value, int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }
  void saveNewTask(){
    setState(() {
      todoList.add([_mycontroller.text,false]);
    });
    Navigator.of(context).pop();
  }

  // create a new task
  void createnewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
            controller: _mycontroller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
    },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange[200],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        centerTitle: true,
        title: Text("TO DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createnewTask,
        child: Icon(Icons.add),
        backgroundColor: Colors.deepOrange[400],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
          itemBuilder: (context, index) {
          return ToDoTile(
              taskName: todoList[index][0],
              taskCompleted: todoList[index][1],
              onChanged: (value) => checkboxChanged(value,index),
          );
          },
      ),
    );
  }
}
