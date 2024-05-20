import 'package:api_0_1/model/todo_model.dart';

class MainDataModel {
  int? total;
  int? skip;
  int? limit;
  List<TodoModel>? todos;

  MainDataModel(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.todos});

  factory MainDataModel.fromJson(Map<String, dynamic> json) {

    List<TodoModel> allTodos =[];
    
    for(Map<String, dynamic> echoTodos in json['todos']){
    TodoModel todoModel = TodoModel.fromJson(echoTodos);
    allTodos.add(todoModel);


    }


    return MainDataModel(
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
        todos: allTodos
      );
  }
}
