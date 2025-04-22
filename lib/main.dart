import 'package:calculator_app/cubits/calculator_cubit.dart';
import 'package:calculator_app/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator App',
      home: BlocProvider(
        create: (context) => CalculatorCubit(),
        child: HomeView(),
      ),
    );
  }
}
