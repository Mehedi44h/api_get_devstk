import 'dart:convert';

import 'package:fluapiwork/model/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  bool isLoading = false;
  List modelList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<List> getData() async {
    var res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));

    Map<String, dynamic> data =
        Map<String, dynamic>.from(json.decode(res.body));
    setState(() {
      modelList = [data];
    });
    return modelList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: isLoading
                ? CircularProgressIndicator()
                : Column(children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: modelList.length,
                            itemBuilder: (context, index) {
                              return Card(
                                  margin: EdgeInsets.all(10),
                                  child: Column(children: [
                                    Text(
                                      modelList[index]['name'].toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                        modelList[index]['username'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        )),
                                    Text(modelList[index]['email'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        )),
                                    Text(modelList[index]['address'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        )),
                                    Text(modelList[index]['phone'].toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                        )),
                                    Text(
                                      modelList[index]['website'].toString(),
                                    ),
                                    Text(
                                      modelList[index]['company'].toString(),
                                    ),
                                  ]));
                            }))
                  ])));
  }
}
