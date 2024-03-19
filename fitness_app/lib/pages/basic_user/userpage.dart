// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:fitness_app/pages/login_page.dart';
import 'package:fitness_app/consts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:fitness_app/pages/basic_user/daily_details.dart';
import 'package:fitness_app/pages/basic_user/recipes.dart';
import 'package:fitness_app/pages/basic_user/workoutsplits.dart';
import 'package:fitness_app/pages/basic_user/videos.dart';
import 'package:fitness_app/pages/basic_user/antrenori_list.dart';
class UserPage extends StatefulWidget{
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}
class _UserPageState extends State<UserPage> {
  List info=[];
  _initData(){
    DefaultAssetBundle.of(context).loadString('json/info.json').then((value){
      setState(() {
        info=json.decode(value);
      });
  });
  }

  @override
  void initState(){
    super.initState();
    _initData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add a back button to the app bar
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            // Navigate back when the back button is pressed
             Navigator.push(context, MaterialPageRoute(builder: ((context) => LoginPage())));
          },
        ),
        title: const Text('User dashboard'), 
      ),
    body: Container(
      padding: const EdgeInsets.only(top:10,left: 30,right: 30),
      child:Column(
        children: [
          Row(
            children: [
            Text(
              "Today",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700
              ),
            ),
          ],
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              const Text(
                "Daily progress",
                style: TextStyle(
                  fontSize: 20,
                  //color
                  fontWeight: FontWeight.w700
                ),
              ),
              Expanded(child: Container()),
              Text(
                "Details",
                style: TextStyle(
                  fontSize: 20,
                  //color
                  color:Colors.lightBlue[100]
                ),
              ),
              InkWell(
                onTap: (){
                  Get.to(()=>MealHistory());
                },
                child: Icon(Icons.arrow_forward,
                size:20,),
              ),
              SizedBox(width: 15,)
            ],
            ),
          SizedBox(height: 15,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [g1opac,g3],
                begin: Alignment.bottomLeft,
                end: Alignment.centerRight
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(80)
              ),
            boxShadow: [
              BoxShadow(
                offset: Offset(10,10),
                blurRadius: 10,
                color:g3.withOpacity(0.4)
              )
            ]
            ),
            child: Container( //folosesc container pt ca column nu ia padding direct
              padding: const EdgeInsets.only(left: 20, top:25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 //cross- orizontal, main-vertical
                children: [
                  Text("Calories",
                    style: TextStyle(
                      fontSize:25,
                    //color:
                  ),
                  ),
                  Text("Remaining = Goal- Food + Exercise",
                    style: TextStyle(
                      fontSize:10,
                    //color:
                  ),
                  ),
                  SizedBox(height:10),
                  Container(
                  child:Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                        color: Colors.black, // You can set the color of the circle border
                        width: 2, // You can adjust the width of the circle border
                        ),
                          ),
                      padding: EdgeInsets.all(18),
                      child:Container(
                        child: Column(
                          children:[
                          SizedBox(height: 5),
                          Text("1.234",
                            style: TextStyle(
                            fontSize:35,
                           //color:
                           ),
                          ),
                          Text("Remaining",
                            style: TextStyle(
                            fontSize:15,
                           //color:
                           ),
                         ),
                          ],
                        ),
                      ),
                      ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15),
                        Row(
                          children: [
                            //SizedBox(width: 40),
                            Icon(Icons.timer, size:20),
                            Text("Base goal:  ",
                            style: TextStyle(
                            fontSize:15,
                           //color:
                           ),
                         ),
                         Text("2450",
                            style: TextStyle(
                            fontSize:15,
                           //color:
                           ),
                         ),
                          ],
                        ),
                        Row(
                          children: [
                            //SizedBox(width:5),
                            Icon(Icons.timer, size:20),
                            Text("Food:  ",
                            style: TextStyle(
                            fontSize:15,
                           //color:
                           ),
                         ),
                         Text("1000",
                            style: TextStyle(
                            fontSize:15,
                           //color:
                           ),
                         ),
                          ],
                        ),
                        Row(
                          children: [
                            //SizedBox(width: 20),
                            Icon(Icons.timer, size:20),
                            Text("Exercise:  ",
                            style: TextStyle(
                            fontSize:15,
                           //color:
                           ),
                         ),
                         Text("300",
                            style: TextStyle(
                            fontSize:15,
                           //color:
                           ),
                         ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  ),
                  ),
                ],),
                
            ), 
          ),

          Row(
            children: [
              SizedBox(height: 60),
              Text(
                "Explore beyond diet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ), 
          Expanded(child: OverflowBox(
            maxWidth: MediaQuery.of(context).size.width,
            child: ListView.builder(
              itemCount: (info.length.toDouble()/2).toInt(),
              itemBuilder: (_, i,){
                int a= 2*i; //0,2,4,...
                int b= 2*i+1; //1,3,5,..
              return Row(
                children: [
                  //aici trb aplicat inkwal Get.to si info din json(acum pe orice as apsasa ma trimtie la workout)
                  InkWell(
                    onTap: (){
                      _navigateToPage(info[a]["title"]);
                        },
                    child: Container(
                      height: 170,
                      width: (MediaQuery.of(context).size.width-90)/2,
                      margin: EdgeInsets.only(left:30, bottom: 15,top:5),
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image:AssetImage(
                            info[a]['img']
                          ),
                        ),
                        boxShadow:  [
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(5, 5),
                            color: g3,
                          ),
                          BoxShadow(//asta pt umbra inversa din stanga(initial imi place fara)
                            blurRadius: 3,
                            offset: Offset(-5, -5),
                            color: g3,
                          ),
                        ]
                      ),
                      child: Center(
                        child:Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            info[a]["title"],
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ) ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      _navigateToPage(info[b]["title"]);
                        },
                    child: Container(
                      height: 170,
                      width: (MediaQuery.of(context).size.width-90)/2,
                      margin: EdgeInsets.only(left:30, bottom: 15,top:5),
                      padding: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image:AssetImage(
                            info[b]['img']
                          ),
                        ),
                        boxShadow:  [
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(5, 5),
                            color: g3,
                          ),
                          BoxShadow(//asta pt umbra inversa din stanga(initial imi place fara)
                            blurRadius: 3,
                            offset: Offset(-5, -5),
                            color: g3,
                          ),
                        ]
                      ),
                      child: Center(
                        child:Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            info[b]["title"],
                            style: TextStyle(
                              fontSize: 20,
                            )
                          ),
                        ) ),
                    ),
                  ),
                ],
              );
              }),
          ),
          ),
        ],
      ),
    )
  );
  }
}

void _navigateToPage(String pageTitle) {
  switch (pageTitle) {
    case "Workouts":
      Get.to(() => WorkoutVideos());
      break;
    case "Workout splits":
      Get.to(() => WorkoutSplitsPage());
      break;
    case "Healthy Recipes":
      Get.to(() => Recipes());
      break;
    case "Pro Trainers":
      Get.to(() => Trainers());
      break;
}
}