import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<double> {
  CalculatorCubit() : super(0.0);

  void add(double num1, double num2) {
    emit(num1 + num2);
  }

  void subtract(double num1, double num2) {
    emit(num1 - num2);
  }

  void multiply(double num1, double num2) {
    emit(num1 * num2);
  }

  void divide(double num1, double num2) {
    if (num2 != 0) {
      emit(num1 / num2);
    } else {
      emit(double.nan); 
    }
  }

  void clear() {
    emit(0.0);
  }
}
