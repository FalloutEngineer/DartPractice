import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/database.dart';
import 'package:todo/models/task_model.dart';

import 'task.dart';
import 'task_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DatabaseController _dbc = DatabaseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Taskpage(
                        task: TaskModel(),
                      ))).then((value) => setState(() {}));
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          color: Colors.grey[400],
          child: Stack(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: FutureBuilder(
                    initialData: [],
                    future: _dbc.getTasks(),
                    builder: (context, snapshot) {
                      var data = (snapshot.data as List<dynamic>).toList();
                      return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Taskpage(
                                      task: data[index],
                                    ),
                                  )).then(
                                (value) => {setState(() {})},
                              );
                            },
                            child: TaskCard(
                              title: data[index].title,
                              taskBody: data[index].text,
                            ),
                          );
                        },
                      );
                    },
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
