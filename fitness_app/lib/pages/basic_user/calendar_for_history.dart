import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:fitness_app/pages/basic_user/mealhistory.dart';
import 'package:get/get.dart';
import 'package:fitness_app/consts.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [g1opac, g2, g3],
            begin: const FractionalOffset(0.0, 0.8),
            end: Alignment.topRight,
          ),
        ),
        child: Container(
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: CalendarCarousel<Event>(
                  onDayPressed: (DateTime date, List<Event> events) {
                    setState(() {
                      _selectedDate = date;
                    });
                     Get.to(() => MealHistory(selectedDate: date));
                  
                  },
                  
                  markedDateIconBuilder: (event) {
                    return event.icon;
                  },
                  weekendTextStyle: TextStyle(
                    color: Colors.black
                  ),
                  prevDaysTextStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  nextDaysTextStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            
          ],
        ),
      ),
      ),
    );
  }
}
