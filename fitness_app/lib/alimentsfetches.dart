import 'dart:convert';
import 'package:fitness_app/pages/basic_user/userpage.dart';
import 'package:fitness_app/pages/coachpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fitness_app/main.dart';

Future<List> getAliments() async {
  var response = await http.get(
    Uri.parse("http://10.0.2.2:8080/auth/aliments/"),
    headers: {"Content-Type": "application/json"},
  );
  
  if (response.statusCode == 200) {
    List alimData = json.decode(response.body);
    return alimData;
  } else {
    print('Failed to load aliments: ${response.statusCode}');
    throw Exception('Failed to load aliments');
  }
}