// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModel {
      int? id;
      String? todo;
      bool? completed;
      int? userId;
  
  TodoModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });


  factory TodoModel.fromJson(Map<String, dynamic> json){
    return TodoModel(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId']
    );
  }

  



}
