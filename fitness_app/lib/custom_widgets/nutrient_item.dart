import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class NutrientItem extends StatelessWidget {
  final String label;
  final String value;
  final double percent;

  NutrientItem({required this.label, required this.value, required this.percent});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: maxWidth*0.3, // Adjust the width as needed
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: maxWidth*0.4, // Adjust the width as needed
            padding: EdgeInsets.only(left: 5, right: 5),
            child: LinearPercentIndicator(
              lineHeight: 10.0,
              percent: percent,
              progressColor: Colors.blue,
            ),
          ),
          SizedBox(
            width: maxWidth*0.2, // Adjust the width as needed
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}