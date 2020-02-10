import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MyTest extends StatefulWidget {
  @override
  _MyTestState createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  Map data;
  List userData;

  //getDataUser
  Future getData() async {
    http.Response response =
    await http.get("https://reqres.in/api/users?page=2");
    data = json.decode(response.body);
    setState(() {
      userData = data["data"];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("MyContact"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,

          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Row(
                  children: <Widget>[
                    CircleAvatar(
                      //addImageApi
                      backgroundImage: NetworkImage(userData[index]["avatar"]),
                    ),
                    new Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: new Text("${userData[index]["first_name"]} ${userData[index]["last_name"]} \n ${userData[index]["email"]}",
                          style: new TextStyle(
                              fontFamily: 'Raleway', fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.add),
          onPressed: null
      ),
    );
  }
}
