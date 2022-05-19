// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todo_app_4/models/notes_model.dart';
import 'package:todo_app_4/service/db.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController taskController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(height: 40,),
              TextField(
                controller: taskController,
                decoration: InputDecoration(
                  hintText: "Add a task",
                  filled: true,
                ),
              ),
              SizedBox(height: 30,),
              RaisedButton(onPressed: () async{
                DB db=DB();
                await  db.insertNote(Note(dateTime: DateTime.now().toString(), task: taskController.text));
                taskController.text="";
                Navigator.pop(context);
              },
              child: Text("Add Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}