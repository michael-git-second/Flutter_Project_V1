// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flu3/Utils/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<login> {
  Future<user> getRequest() async {
    String url = "https://basic-api-app-node.herokuapp.com/user_det";
    final response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    var responseData = json.decode(response.body);
    user emp = user();
    emp.signIn(responseData['email__c'], responseData['password__c']);
    print(responseData[1]);
    return emp;
  }

  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();
  late String uname;
  late String upassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("LOGIN"),
        backgroundColor: Colors.orange[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                  width: 200,
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email'),
                controller: fieldText1,
                onChanged: (val1) {
                  uname = val1;
                },
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                controller: fieldText2,
                onChanged: (val2) {
                  upassword = val2;
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  //user e = await getRequest();
                  //print(e.email);
                  getRequest();
                  Provider.of<user>(context, listen: false)
                      .signIn(uname, upassword);
                  Get.to(() => home());
                },
                color: Colors.orange[800],
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
