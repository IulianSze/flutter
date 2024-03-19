import 'package:flutter/material.dart';
import 'package:fitness_app/pages/login_page.dart';

class CoachPage extends StatelessWidget{
  const CoachPage({Key? key}) : super(key: key);

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
             Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage())));
          },
        ),
        title: const Text('Coach dashboard'), 
      ),
      body: const Center(
        child: Text(
          'For coach',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}