import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/components/dialog_box.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
  void initState() {
    // if this is the first time opening the app, then create default data
    if(_mybox.get("TODOLIST")==null){
      db.createIntialData();
    }else{
      //there is always exists data
      db.loadData();
    }
  }

  // refrence the box
  final _mybox = Hive.box("mybox");


  // text controller
  final _mycontroller = TextEditingController();

  ToDoDataBase db = ToDoDataBase();
  // checkbox was tapped
  void checkboxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_mycontroller.text,false]);
    });
    Navigator.of(context).pop();
    db.updateDataBase();

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
    db.updateDataBase();

  }

  // delete task function
  void DeleteFunction(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
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
        itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
          return ToDoTile(
              taskName:db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkboxChanged(value,index),
              deleteTile:(context) => DeleteFunction(index),
          );
          },
      ),
    );
  }
}
