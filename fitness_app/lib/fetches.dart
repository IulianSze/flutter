// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:convert';
import 'package:fitness_app/pages/basic_user/userpage.dart';
import 'package:fitness_app/pages/coachpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fitness_app/main.dart';

Future<void> login(context,usernameController, passwordController) async {
  String token = "null";
if(passwordController.text.isNotEmpty && usernameController.text.isNotEmpty){
  Map data = {
    'username':"${usernameController.text}",
    'password':"${passwordController.text}"
  };
  var body = jsonEncode(data);
  var response = await http.post(Uri.parse("http://10.0.2.2:8080/auth/login"),
  headers: {"Content-Type": "application/json"},
  body: body
  );
  if(response.statusCode ==200){
    token=await extractTokenFromJson(response);
    dashboardRoutes(token, context);
    //Navigator.push(context, MaterialPageRoute(builder: ((context) => DataDisplayPage(token: token,))));
  } else{
    ScaffoldMessenger.of(context)
    .showSnackBar(const SnackBar(content: Text("Invalid Credentials.")));
  }
}else {
  ScaffoldMessenger.of(context)
    .showSnackBar(const SnackBar(content: Text("Please complete the required fields")));
}
}

Future<String> extractTokenFromJson(var jsonResponse) async {

  Map<String, dynamic> resp = json.decode(jsonResponse.body.toString());
  String token = resp['jwt'];

  return token;
}

Future<void> dashboardRoutes(token, context) async{
      
      var responsecoach = await http.get(
        Uri.parse("http://10.0.2.2:8080/coach/"),
        headers: {'Authorization': 'Bearer $token'},
      );

      var responseuser = await http.get(
          Uri.parse("http://10.0.2.2:8080/user/"),
          headers: {'Authorization': 'Bearer $token'},
      );

      if (responsecoach.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => const CoachPage())));
      }
      else{
        if(responseuser.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => BottomNavBar())));
          }
    }
}

