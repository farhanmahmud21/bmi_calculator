import 'package:flutter/material.dart';
import 'custom_input_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double bmiResult = 0;
  String bmiCategory = '';

  double calculateBMI() {
    // Parse input values
    double height = double.tryParse(heightController.text) ?? 0;
    double weight = double.tryParse(weightController.text) ?? 0;

    // Convert height from feet to meters (1 foot = 0.3048 meters)
    double heightInMeters = height * 0.3048;

    // BMI formula: weight(kg) / (height(m))^2
    if (heightInMeters > 0 && weight > 0) {
      return weight / (heightInMeters * heightInMeters);
    }
    return 0;
  }

  void getBMICategory() {
    if (bmiResult < 18.5) {
      bmiCategory = "Underweight";
    } else if (bmiResult >= 18.5 && bmiResult < 25) {
      bmiCategory = "Normal";
    } else if (bmiResult >= 25 && bmiResult < 30) {
      bmiCategory = "Overweight";
    } else {
      bmiCategory = "Obese";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CustomInputField(
                controller: ageController,
                hintText: 'Age',
                prefixIcon: Icons.person,
              ),
              SizedBox(height: 10),
              CustomInputField(
                controller: heightController,
                hintText: 'Height',
                prefixIcon: Icons.height_rounded,
                suffixText: 'Feet',
              ),
              SizedBox(height: 10),
              CustomInputField(
                controller: weightController,
                hintText: 'Weight',
                prefixIcon: Icons.monitor_weight,
                suffixText: 'KG',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    bmiResult = calculateBMI();
                    getBMICategory();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text('Calculate BMI',
                    style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20),
              bmiResult > 0
                  ? Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Your BMI: ${bmiResult.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Category: $bmiCategory',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ));
  }
}
