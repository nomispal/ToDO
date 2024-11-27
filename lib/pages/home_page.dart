import 'package:flutter/material.dart';
import 'package:todo/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  // list of todo tasks
  List todoList = [
     ["make tutorial", false],
    ["do exercise", false],
  ];

  // checkbox was tapped
  void checkboxChanged(bool? value, int index){
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });

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