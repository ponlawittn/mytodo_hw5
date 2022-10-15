import 'package:flutter/material.dart';
import 'package:homework5/todoo.dart';


class AddToDo extends StatelessWidget{
  final ToDoo todo;
  final onToDoChanged;
  final onDeleteItem;
  const AddToDo ({Key? key, required this.todo, this.onToDoChanged, this.onDeleteItem, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box :Icons.check_box_outline_blank,
          color: Colors.cyan,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          child: IconButton(
            color: Colors.cyan,
            iconSize: 25,
            icon: Icon(Icons.delete),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),


      ),

    );
  }
}