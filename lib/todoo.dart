class ToDoo {
  String? id;
  String? todoText;
  bool isDone;

  ToDoo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDoo> todoList() {
    return [
      ToDoo(id: '01', todoText: 'ส่งการบ้านครั้งที่ 4 วิชา Mobile App Dev', isDone: true ),
      ToDoo(id: '02', todoText: 'ส่งการบ้านครั้งที่ 5 วิชา Mobile App Dev', isDone: false ),
      ToDoo(id: '03', todoText: 'ทำโปรเจ็ควิชา Mobile App Dev',isDone: false ),


    ];
  }
}