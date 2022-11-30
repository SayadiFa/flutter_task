import 'package:flutter_task/app_main_function.dart';
import 'package:test/test.dart';


void main() {
  test('checking the examples provided', () {
    final mainFunction = MainFunction();

    mainFunction.checkRecursive(10, 2, 1, 0);
    expect(mainFunction.finalResults, 1);

    mainFunction.checkRecursive(100, 2, 1, 0);
    expect(mainFunction.finalResults, 3);

    mainFunction.checkRecursive(100, 3, 1, 0);
    expect(mainFunction.finalResults, 1);
  });
}