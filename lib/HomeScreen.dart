import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var weightController = TextEditingController();
  var feetController = TextEditingController();
  var inchController = TextEditingController();
  var result = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 150,
              child: Image.network(
                'https://health.wordpress.clevelandclinic.org/wp-content/uploads/sites/3/2022/01/MeasuringBMI-1293501993-770x533-1.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 11,
            ),
            Text(
              'Calculate BMI',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 250,
              height: 50,
              child: TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    label: Text('Enter Your Weight in KG'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11))),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 50,
              width: 250,
              child: Row(
                children: [
                  Container(
                    width: 120,
                    child: TextField(
                      controller: feetController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text('Feet'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    child: TextField(
                      controller: inchController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          label: Text('Inch'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11))),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                var wight = weightController.text.toString();
                var feet = feetController.text.toString();
                var inch = inchController.text.toString();
                if (wight != "" && feet != "" && inch != "") {
                  var wt = int.parse(wight);
                  var ft = int.parse(feet) * 0.3048;
                  var inc = int.parse(inch) * 0.0254;

                  var totalHeight = ft + inc;
                  var bmi = wt / (totalHeight * totalHeight);

                  setState(() {
                    result = "Your BMI is : ${bmi.toStringAsFixed(2)}";
                  });
                } else {
                  setState(() {
                    result = 'Please provide all informations';
                  });
                }
              },
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              result,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
