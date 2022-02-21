// ignore_for_file: dead_code, prefer_const_constructors

import 'package:flu3/Utils/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<user>(builder: (context, user, _) {
      return MaterialApp(
          home: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Colors.orange[800],
        ),
        body: Center(
          child: Container(
            height: 80,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.orange[800],
              child: Text(
                user.email.toString(),
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ),
      ));
    });
  }
}
