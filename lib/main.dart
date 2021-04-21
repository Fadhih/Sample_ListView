import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'model/Users.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List <Users> userList = new List();

  @override

   void initState()
  {
    _getRequest();
    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List of Posts'),
      ),

      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context,index){
          return ListTile(title: Text(userList[index].title),
            subtitle: Text(userList[index].body),);
    }),
     );
  }

  Future <List<Users>> _getRequest() async {
    String url='https://jsonplaceholder.typicode.com/posts';
    Response response = await get(url);
    var rb = response.body;
    var list = json.decode(rb)as List;
    List<Users>listvalues = list.map((e) => Users.fromJson(e)).toList();

    setState(() {
       userList.addAll(listvalues);
    });

  }
}
