import 'package:flutter/material.dart';
import 'package:homework5/todoo.dart';

import 'newtodoo.dart';





class MytodoPage extends StatefulWidget {
  MytodoPage({Key? key}) : super(key: key);
  @override
  _MytodoPageState createState() => _MytodoPageState();
}

class _MytodoPageState extends State<MytodoPage> {
  bool selected = false;
  final _todoController = TextEditingController();
  final Todolist = ToDoo.todoList();
  List<ToDoo> _list = [];
  @override
  void initState() {
    _list = Todolist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.purpleAccent,
      appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Row(
            children: [
              Icon(
                Icons.check_box_rounded,
                color: Colors.white,
                size: 30,
              ),
              Text(' My ToDo',


              ),

            ],
          )),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: ListView(
              children: [
                for (ToDoo todoo in _list.reversed)
                  AddToDo(
                    todo: todoo,
                    onToDoChanged: _handleToDoChange,
                    onDeleteItem: _deleteToDoItem,
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                      right: 10,
                      left: 10,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: 'Enter New ToDo ',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                    right: 10,
                    left: 10,
                  ),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                      print(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleToDoChange(ToDoo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      Todolist.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      Todolist.add(ToDoo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<ToDoo> results = [];
    if (enteredKeyword.isEmpty) {
      results = Todolist;
    } else {
      results = Todolist.where((item) => item.todoText!
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase())).toList();
    }

    setState(() {
      _list = results;
    });
  }
}