import 'dart:async';

import 'package:bmi_calculator/HomeScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                    'https://health.wordpress.clevelandclinic.org/wp-content/uploads/sites/3/2022/01/MeasuringBMI-1293501993-770x533-1.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'BMI CALCULATOR',
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
