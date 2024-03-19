import 'package:flutter/material.dart';
import 'package:fitness_app/consts.dart';
import 'package:get/get.dart';
import 'package:fitness_app/main.dart';
class Trainers extends StatefulWidget{
  const Trainers({Key? key}) : super(key: key);

  @override
  _TrainersState createState() => _TrainersState();
}

class _TrainersState extends State<Trainers> {
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
        title: const Text('Traineri'), 
      ),
      body: const Center(
        child: Text(
          'Traineri profesionisti',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}