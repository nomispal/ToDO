import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}
void greetuser(){
  print(_mycontroller.text);
}

 TextEditingController _mycontroller = TextEditingController();
class _ToDoPageState extends State<ToDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _mycontroller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "type"
                ),
              ),
              ElevatedButton(
                  onPressed: greetuser,
                  child: Text("Tap"))
            ],
          ),
        ),
      ),
    );
  }
}
