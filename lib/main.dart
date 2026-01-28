import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    );
  }
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  double result = 0;
  int? indexSelected;
  TextEditingController no1 = TextEditingController();
  TextEditingController no2 = TextEditingController();

  void calculation() {
    double number1 = double.parse(no1.text);
    double number2 = double.parse(no2.text);
    if (indexSelected == 1) {
      result = number1 + number2;
    } else if (indexSelected == 2) {
      result = number1 - number2;
    } else if (indexSelected == 3) {
      result = number1 * number2;
    } else if (indexSelected == 4) {
      result = number1 / number2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator", style: TextStyle(color: Colors.green)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: no1,
              decoration: InputDecoration(
                labelText: "Number 1",
                hintText: "Enter first no",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: no2,
              decoration: InputDecoration(
                labelText: "Number 2",
                hintText: "Enter second no",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      indexSelected == 1 ? Colors.teal : Colors.white70,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      indexSelected = 1;
                    });
                  },
                  child: Center(child: Text("+")),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      indexSelected == 2 ? Colors.teal : Colors.white70,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      indexSelected = 2;
                    });
                  },
                  child: Center(child: Text("-")),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      indexSelected == 3 ? Colors.teal : Colors.white70,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      indexSelected = 3;
                    });
                  },
                  child: Center(child: Text("*")),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      indexSelected == 4 ? Colors.teal : Colors.white70,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      indexSelected = 4;
                    });
                  },
                  child: Center(child: Text("/")),
                ),
              ],
            ),

            SizedBox(height: 10),
            InkWell(
              onTap: () {
                calculation();
                setState(() {});
              },
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.teal),
                child: Center(child: Text("Calculate")),
              ),
            ),
            SizedBox(height: 10),
            Text("$result", style: TextStyle(fontSize: 28)),
          ],
        ),
      ),
    );
  }
}
