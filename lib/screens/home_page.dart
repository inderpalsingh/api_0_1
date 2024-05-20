import 'dart:convert';

import 'package:api_0_1/model/main_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainDataModel? todoModel;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: todoModel != null
            ? ListView.builder(
                itemCount: todoModel!.todos!.length,
                itemBuilder: (context, index) {
                  return todoModel!.todos![index].completed==true
                      ? Container(
                          color: Colors.green,
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text('${todoModel!.todos![index].id}')),
                            title: Text('${todoModel!.todos![index].todo}'),
                            subtitle: Text(
                                'UserId:  ${todoModel!.todos![index].userId}'),
                          ))
                      : Container(
                          color: Colors.yellow,
                          child: ListTile(
                            leading: CircleAvatar(
                                child: Text('${todoModel!.todos![index].id}')),
                            title: Text('${todoModel!.todos![index].todo}'),
                            subtitle: Text(
                                'UserId:  ${todoModel!.todos![index].userId}'),
                          ));
                },
              )
            : const Center(
                child: Text('No todo list'),
              ));
  }

  getData() async {
    String baseUrl = "https://dummyjson.com/todos";

    http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var mData = response.body;
      var rawData = jsonDecode(mData);
      todoModel = MainDataModel.fromJson(rawData);

      setState(() {});
    }
  }
}
