// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final numAmountController = TextEditingController();
  final numPercentageController = TextEditingController();

  bool validate = false;
  @override
  void dispose() {
    numAmountController.dispose();
    numPercentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(('Percentage Calculator')),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blue.shade300,
            Colors.blue.shade200,
            Colors.blue.shade100,
            Colors.blue.shade50,
          ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TextField(
                      controller: numAmountController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'AMOUNT *',
                        errorText: validate ? 'Fill the field' : null,
                        errorStyle: const TextStyle(
                          color: Colors.red,
                        ),
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      controller: numPercentageController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Percantage*',
                        errorText: validate ? 'Fill the field' : null,
                        errorStyle: TextStyle(
                          color: Colors.red,
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          calculateNow();
                        });

                        //
                      },
                      child: Text(
                        "SEE THE RESULT",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Percentage is : $displayResult',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'After minus the percentage, amount is : $displayResultMinus',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'After adding the percentage, amount is : $displayResultAdd',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  var displayResult = 0.0,
      inputtedAmount = 0.0,
      inputtedPercentage = 0.0,
      displayResultAdd = 0.0,
      displayResultMinus = 0.0;

  void calculateNow() {
    setState(() {
      inputtedAmount = double.parse(numAmountController.text);
      inputtedPercentage = double.parse(numPercentageController.text);

      displayResult = (inputtedAmount * inputtedPercentage) / 100;

      displayResultAdd = inputtedAmount + displayResult;
      displayResultMinus = inputtedAmount - displayResult;
    });
  }
}
