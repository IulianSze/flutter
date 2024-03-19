import 'package:flutter/material.dart';
import 'package:fitness_app/consts.dart';
import 'package:get/get.dart';

class WorkoutVideos extends StatefulWidget{
  const WorkoutVideos({Key? key}) : super(key: key);

  @override
  _WorkoutVideosState createState() => _WorkoutVideosState();
}

class _WorkoutVideosState extends State<WorkoutVideos> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [g1.withOpacity(0.85),g2],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          )
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top:70, left:30, right:30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back,size:20,)),
                      Expanded(child: Container()),
                      Icon(Icons.info_outline,size:20,),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}