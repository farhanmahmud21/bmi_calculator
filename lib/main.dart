import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.grey),
          prefixIconColor: Colors.blue,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
        ),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: CustomedTextFeild(),
    );
  }
}

class CustomedTextFeild extends StatelessWidget {
  const CustomedTextFeild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: "Age", prefixIcon: Icon(Icons.person)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Height ",
                prefixIcon: Icon(Icons.height_rounded),
                suffixText: 'Feet',
                suffixStyle: TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Weight ",
                prefixIcon: Icon(Icons.monitor_weight),
                suffixText: "KG",
                suffixStyle: TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}
