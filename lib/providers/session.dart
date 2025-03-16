import 'package:flutter/material.dart';

class Session extends ChangeNotifier {
  bool logedIn = false;
  String username = "";
  String useremail = "";
  String usermobile = "";
  String userimageurl = "";

  Session({
    required this.logedIn,
    required this.username,
    required this.useremail,
    required this.usermobile,
    required this.userimageurl,
  });

  void login(name, email, mobile, imageurl) {
    logedIn = true;
    username = name;
    useremail = email;
    usermobile = mobile;
    userimageurl = imageurl;

    notifyListeners();
  }
}
