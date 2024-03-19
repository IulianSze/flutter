// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:fitness_app/consts.dart';
import 'package:get/get.dart';
import 'package:fitness_app/pages/basic_user/calendar_for_history.dart';

class MealHistory extends StatefulWidget{
  final DateTime selectedDate;
  const MealHistory({Key? key, required this.selectedDate}) : super(key: key);

  @override
  _MealHistoryState createState() => _MealHistoryState();
}

class _MealHistoryState extends State<MealHistory> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: null,
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
              Text(
            'Meals you had in: ${widget.selectedDate}',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          ],
        ),
      ),
    );
  }
}