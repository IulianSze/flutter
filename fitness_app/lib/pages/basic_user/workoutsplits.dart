import 'package:flutter/material.dart';
import 'package:fitness_app/consts.dart';
import 'package:get/get.dart';
import 'package:fitness_app/main.dart';
class WorkoutSplitsPage extends StatefulWidget{
  const WorkoutSplitsPage({Key? key}) : super(key: key);

  @override
  _WorkoutSplitsPageState createState() => _WorkoutSplitsPageState();
}

class _WorkoutSplitsPageState extends State<WorkoutSplitsPage> {
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
        title: const Text('Splits'), 
      ),
      body: const Center(
        child: Text(
          'Workout splits',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}