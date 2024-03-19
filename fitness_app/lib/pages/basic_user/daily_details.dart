import 'package:flutter/material.dart';
import 'package:fitness_app/consts.dart';
import 'package:get/get.dart';
import 'package:fitness_app/custom_widgets/nutrient_item.dart';

class MealHistory extends StatefulWidget{
  const MealHistory({Key? key}) : super(key: key);

  @override
  _MealHistoryState createState() => _MealHistoryState();
}

class _MealHistoryState extends State<MealHistory> {
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
        child: Container(
          //height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top:70, left: 20, right: 10),
          child: Column(
            children:[
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  children:[
                    InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back,size:20,)),
                    Expanded(child:Container()),
                    Text(
                    "Calories remained: ",
                      style: TextStyle(
                      fontSize: 25,
                     ),
                    ),
                    Text(
                      "1231",
                      style: TextStyle(
                      fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              NutrientItem(label: 'Proteins', value: '50g', percent: 0.4),
              SizedBox(height: 10),
              NutrientItem(label: 'Carbohydrates', value: '100g', percent: 0.7),
              SizedBox(height: 10),
              NutrientItem(label: 'Fibers', value: '20g', percent: 0.2),
              SizedBox(height: 10),
              NutrientItem(label: 'Fat', value: '30g', percent: 0.6),
              SizedBox(height: 10),
              NutrientItem(label: 'Sodium', value: '0.6g', percent: 0.85),
              SizedBox(height: 10),
              NutrientItem(label: 'Potasium', value: '20g', percent: 0.2),
              
            ],
          ),
        ),
      ),
    );
  }
}