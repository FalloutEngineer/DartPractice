import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/database.dart';
import 'package:todo/main.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/todo.dart';
import 'package:todo/widgets/todo_widget.dart';

class Taskpage extends StatefulWidget {
  final TaskModel? task;

  const Taskpage({Key? key, this.task}) : super(key: key);

  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  DatabaseController _db = DatabaseController();
  int _taskId = 0;
  String _taskTitle = "";
  String _taskDescription = "";

  late FocusNode _titleFocus;
  late FocusNode _descriptionFocus;
  late FocusNode _todoFocus;

  bool _contentVisibility = false;

  @override
  void initState() {
    if (widget.task!.id != null) {
      _contentVisibility = true;

      _taskTitle = widget.task!.title ?? "";
      _taskDescription = widget.task!.text ?? "";
      _taskId = widget.task!.id ?? 0;
    }

    _titleFocus = FocusNode();
    _descriptionFocus = FocusNode();
    _todoFocus = FocusNode();

    super.initState();
  }

  @override
  void dispose() {
    _titleFocus.dispose();
    _descriptionFocus.dispose();
    _todoFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: _contentVisibility,
        child: FloatingActionButton(
          onPressed: () async {
            if (_taskId != 0) {
              await _db.deleteTask(_taskId);
              Navigator.pop(context);
            }
          },
          child: const Icon(Icons.delete),
          backgroundColor: Colors.red,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                Expanded(
                  child: TextField(
                    focusNode: _titleFocus,
                    onSubmitted: (value) async {
                      if (value != '') {
                        if (widget.task!.id == null) {
                          _taskId =
                              await _db.insertTask(TaskModel(title: value));
                          setState(() {
                            _contentVisibility = true;
                            _taskTitle = value;
                          });
                          _todoFocus.requestFocus();
                        } else {
                          _db.updateTaskTitle(_taskId, value);
                        }

                        _descriptionFocus.requestFocus();
                      }
                    },
                    controller: TextEditingController()..text = _taskTitle,
                    decoration:
                        const InputDecoration(hintText: "Enter Task Title"),
                  ),
                )
              ],
            ),
            TextField(
              focusNode: _descriptionFocus,
              onSubmitted: (value) async {
                if (value != "") {
                  if (_taskId != 0) {
                    await _db.updateTaskDescription(_taskId, value);
                    _taskDescription = value;
                  }
                }

                _todoFocus.requestFocus();
              },
              controller: TextEditingController()..text = _taskDescription,
              decoration: const InputDecoration(
                  hintText: "Enter description",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25)),
            ),
            Visibility(
              visible: _contentVisibility,
              child: FutureBuilder(
                initialData: [],
                future: _db.getTodo(_taskId),
                builder: (context, snapshot) {
                  var data = (snapshot.data as List<dynamic>).toList();
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              if (data[index].checked == 0) {
                                await _db.updateTaskStatus(data[index].id, 1);
                              } else {
                                await _db.updateTaskStatus(data[index].id, 0);
                              }
                              setState(() {});
                            },
                            child: ToDoWidget(
                                text: data[index].title,
                                checked:
                                    data[index].checked == 0 ? false : true),
                          );
                        }),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.only(right: 12),
                    child: const Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      child: TextField(
                    focusNode: _todoFocus,
                    controller: TextEditingController()..text = "",
                    onSubmitted: (value) async {
                      if (value != "") {
                        if (_taskId != 0) {
                          ToDoModel _todo = ToDoModel(
                            taskId: _taskId,
                            checked: 0,
                            title: value, id: null, //DO SOMETHING!!!!
                          );
                          await _db.insertToDo(_todo);
                          setState(() {});
                        }
                      }
                    },
                    decoration: const InputDecoration(
                        hintText: "Enter ToDo task...",
                        border: InputBorder.none),
                  ))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
