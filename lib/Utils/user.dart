// ignore_for_file: file_names

import 'package:flutter/material.dart';

class user extends ChangeNotifier {
  String email = "";
  String pwd = "";

  void signIn(String emailTxt, String pwdTxt) {
    email = emailTxt;
    pwd = pwdTxt;
    notifyListeners();
  }
}
