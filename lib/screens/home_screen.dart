// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:todo_app_4/screens/add_task_screen.dart';
import 'package:todo_app_4/service/db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DB db=DB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My To-Do! App"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTaskScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
          future: db.notes(),
          builder: (context,AsyncSnapshot snapshot){
            if(!snapshot.hasData){
              return Center(child: Text("No Task Yet! Yay!"),);
            }else{
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){ 
                return Container(
                  child: Text('${snapshot.data[index].task}'),
                );
              });
            }
          },
        ),
        ),
    );
  }
}