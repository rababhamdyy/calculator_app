import 'package:calculator_app/cubits/calculator_cubit.dart';
import 'package:calculator_app/widgets/mathematic_button.dart';
import 'package:calculator_app/widgets/num_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  void _calculate(BuildContext context, String operation) {
    final num1 = double.tryParse(num1Controller.text) ?? 0.0;
    final num2 = double.tryParse(num2Controller.text) ?? 0.0;

    final calculatorCubit = context.read<CalculatorCubit>();
    switch (operation) {
      case '+':
        calculatorCubit.add(num1, num2);
        break;
      case '-':
        calculatorCubit.subtract(num1, num2);
        break;
      case '*':
        calculatorCubit.multiply(num1, num2);
        break;
      case '/':
        calculatorCubit.divide(num1, num2);
        break;
    }
    FocusScope.of(context).unfocus();
  }

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
              child: BlocBuilder<CalculatorCubit, double>(
                builder: (context, result) {
                  if (result.isNaN) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Cannot divide by zero!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    });
                  }
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: 50, height: 30, color: Colors.teal[800]),
                      Text('Result = $result', style: TextStyle(fontSize: 20)),
                      Container(width: 50, height: 30, color: Colors.teal[800]),
                    ],
                  );
                },
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
                  child: BlocBuilder<CalculatorCubit, double>(
                    builder: (context, result) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MathematicButton(
                            icon: '+',
                            onPressed: () {
                              _calculate(context, '+');
                            },
                          ),
                          MathematicButton(
                            icon: '-',
                            onPressed: () {
                              _calculate(context, '-');
                            },
                          ),
                          MathematicButton(
                            icon: '*',
                            onPressed: () {
                              _calculate(context, '*');
                            },
                          ),
                          MathematicButton(
                            icon: '/',
                            onPressed: () {
                              _calculate(context, '/');
                            },
                          ),
                        ],
                      );
                    },
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
