import 'package:calculator_app/widgets/mathematic_button.dart';
import 'package:calculator_app/widgets/num_text_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double _result = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: Colors.teal[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NumTextField(
                        labelText: 'Num1',
                        controller: num1Controller,
                      ),
                      NumTextField(
                        labelText: 'Num2',
                        controller: num2Controller,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(width: 50, height: 30, color: Colors.teal[800]),
                  Text('Result = $_result', style: TextStyle(fontSize: 20)),
                  Container(width: 50, height: 30, color: Colors.teal[800]),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.teal[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MathematicButton(
                        icon: '+',
                        onPressed: () {
                          setState(() {
                            _result =
                                double.parse(num1Controller.text) +
                                double.parse(num2Controller.text);
                          });
                        },
                      ),
                      MathematicButton(icon: '-', onPressed: () {
                          setState(() {
                            _result =
                                double.parse(num1Controller.text) -
                                double.parse(num2Controller.text);
                          });
                      }),
                      MathematicButton(icon: '*', onPressed: () {
                          setState(() {
                            _result =
                                double.parse(num1Controller.text) *
                                double.parse(num2Controller.text);
                          });
                      }),
                      MathematicButton(icon: '/', onPressed: () {
                          setState(() {
                            _result =
                                double.parse(num1Controller.text) /
                                double.parse(num2Controller.text);
                          });
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
