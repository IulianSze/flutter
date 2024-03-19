import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataDisplayPage extends StatefulWidget {
  final String token;

  const DataDisplayPage({super.key, required this.token});

  @override
  _DataDisplayPageState createState() => _DataDisplayPageState();
}

class _DataDisplayPageState extends State<DataDisplayPage> {
  String fetchedData = 'askdaksfm';
  String titlu = "random ca oricum o sa se schimbe";

  @override
  void initState() {
    super.initState();
    fetchData(); 
  }

  Future<void> fetchData() async {
    try {
      String jwtToken = widget.token;

      var response = await http.get(
        Uri.parse("http://10.0.2.2:8080/coach/"),
        headers: {'Authorization': 'Bearer $jwtToken'},
      );

      if (response.statusCode == 200) {
        setState(() {
          fetchedData = response.body;
          titlu="Coach dashboard";
        });
      } else {
        response = await http.get(
          Uri.parse("http://10.0.2.2:8080/user/"),
          headers: {'Authorization': 'Bearer $jwtToken'},
        );

        if (response.statusCode == 200) {
          setState(() {
            fetchedData = response.body;
            titlu="User basic dashboard";
          });
        } else {
          setState(() {
            fetchedData = 'Failed to fetch data';
          });
        }
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        fetchedData = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(titlu),
          backgroundColor: Colors.orange,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
  body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          // Sections for recipes, workouts, health
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recipes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Add your recipe section here

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Workouts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Add your workout section here

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Health',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Add your health section here

          // Section for displaying consumed calories
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calories Consumed Today',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // Add your code to display consumed calories here
              ],
            ),
          ),
        ],
      ),
    )
    );
  }
}