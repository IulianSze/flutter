import 'package:flutter/material.dart';
import 'package:fitness_app/consts.dart';
import 'package:get/get.dart';
import 'package:fitness_app/alimentsfetches.dart';

class Food {
  final String name;
  Food(this.name);
}

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  _AddFoodState createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
  Map<String, List<String>> mealFoods = {
    "Breakfast": [],
    "Snacks": [],
    "Lunch": [],
    "Dinner": [],
    "Snacks2": [],
  };
  
  // Define a map to keep track of total calories for each meal
  Map<String, double> mealTotalCalories = {
    "Breakfast": 0,
    "Snacks": 0,
    "Lunch": 0,
    "Dinner": 0,
    "Snacks2": 0,
  };
  
  List _addFood(String mealType, String foodName, String quantity, double kcal) {
  double quantityValue = double.tryParse(quantity) ?? 0;
  double newKcalValue = (kcal / 100) * quantityValue;
  double mealKcalSum = mealTotalCalories[mealType] ?? 0;

  // Check if the food already exists in the meal
  bool foodExists = mealFoods[mealType]!.any((food) => food.contains(foodName));
  if (foodExists) {
    // Food of the same type already exists in the meal
    mealFoods[mealType]!.forEach((food) {
      if (food.contains(foodName)) {
        String matchedText = RegExp(r'(\d+(\.\d+)?) g').firstMatch(food)!.group(0)!;
        print("Matched text: $matchedText");
        double existingQuantity = double.parse(RegExp(r'(\d+(\.\d+)?) g').firstMatch(food)!.group(1)!);
        double existingKcal = double.parse(food.split(' - ')[2].split(' ')[0]);

        // Update quantity and kcal
        double newQuantity = existingQuantity + quantityValue;
        double newKcal = existingKcal + newKcalValue;

        mealKcalSum += newKcalValue;

        // Replace the existing food with updated values
        mealFoods[mealType]![mealFoods[mealType]!.indexOf(food)] =
            '$foodName - ${newQuantity.toStringAsFixed(1)} g - ${newKcal.toStringAsFixed(1)} kcal';
      }
    });
  } 
  else {
    mealKcalSum += newKcalValue;
    mealFoods[mealType]!.add("$foodName - ${quantityValue.toStringAsFixed(1)} g - ${newKcalValue.toStringAsFixed(1)} kcal");
  }

  mealTotalCalories[mealType] = mealKcalSum;

  // Recalculate total calories for the day
  double totalCaloriesOfDay = 0;
  mealTotalCalories.values.forEach((calories) {
    totalCaloriesOfDay += calories;
  });

  setState(() {}); // Trigger a rebuild to update the UI

  return [_calculateTotalCalories(), totalCaloriesOfDay];
}
 

  double _calculateTotalCalories() {
    double total = 0;
    mealTotalCalories.values.forEach((calories) {
      total += calories;
    });
    return total;
  }

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
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Text(
                'Total Calories of the day: ${_calculateTotalCalories()} kcal',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              for (var mealType in mealFoods.keys)
                _buildMealSection(mealType, mealFoods[mealType]!, mealTotalCalories[mealType] ?? 0),
              SizedBox(height: 8),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMealSection(String mealType, List<String> foods, double totalCalories) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mealType,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _showAddFoodDialog(mealType);
              },
              child: Text("Add $mealType"),
            ),
            SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: foods.map((food) => Text(food)).toList(),
            ),
            SizedBox(height: 8),
            Text(
              'Total Calories: $totalCalories kcal',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
          
        ),
      ),
    );
  }

  void _showAddFoodDialog(String mealType) async {
    List foodData = await getAliments();
    List<String> foodItems = foodData.map<String>((alim) => alim['alimentName']).whereType<String>().toList();
    String selectedFood = foodItems[0]; // Initialize with the first food item
    String quantity = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Add Food"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: selectedFood,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedFood = newValue!;
                      });
                    },
                    items: foodItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        quantity = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      hintText: 'Enter quantity',
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    Map<String, dynamic>? item = findItem(foodData, selectedFood);
                    var kcal = 0.0;
                    if (item != null) {
                      kcal = item['kcal'];
                    }
                    _addFood(mealType, selectedFood, quantity, kcal);
                    Navigator.of(context).pop();
                  },
                  child: Text("Add"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

Map<String, dynamic>? findItem(List foodData, String selectedFood) {
  Map<String, dynamic>? selectedFoodInfo;
  for (var item in foodData) {
    if (item['alimentName'] == selectedFood) {
      selectedFoodInfo = item;
      break;
    }
  }
  return selectedFoodInfo;
}

void AttributeValues(item, kcal, carbohidrates, proteins, fibers, vitA, vitB, vitC, magnezium, sodium,quantity) {
  kcal = item['kcal'];
  carbohidrates = item['carbohidrates'];
  proteins = item['proteins'];
  fibers = item['fibers'];
  vitA = item['vitA'];
  vitB = item['vitB'];
  vitC = item['vitC'];
  magnezium = item['magnezium'];
  sodium = item['sodium'];
}