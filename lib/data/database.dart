import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  // refernece our box
  final _mybox = Hive.box('mybox');


  // run this method for openning first time this app
  void createIntialData() {
    toDoList = [
      ["Learn Flutter" , false],
      ["Do Exercise", false],
    ];
  }

  //  load the database

  void loadData (){
    toDoList = _mybox.get("TODOLIST");

  }

  // update database
  void updateDataBase(){
    _mybox.put("TODOLIST", toDoList);
  }

}