// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fitness_app/consts.dart';
import 'package:get/get.dart';
import 'package:fitness_app/main.dart';
class Recipes extends StatefulWidget{
  const Recipes({Key? key}) : super(key: key);

  @override
  _RecipesState createState() => _RecipesState();
}

class _RecipesState extends State<Recipes> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add a back button to the app bar
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back when the back button is pressed
             Navigator.push(context, MaterialPageRoute(builder: ((context) => BottomNavBar())));
          },
        ),
        title: const Text('Retete sanatoase'), 
      ),
      body: const Center(
        child: Text(
          'Retete',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}