import 'dart:math';

class MainFunction{

  int finalResults = 0;

 int checkRecursive(int x, int n, int currentNumber,
    int currentSum) {
  int results = 0;

  int p = pow(currentNumber, n).toInt();
  while (p + currentSum < x) {
    results += checkRecursive(x, n, currentNumber + 1,
        p + currentSum);
    currentNumber++;
    p = pow(currentNumber, n).toInt();
  }

  if (p + currentSum == x) {
    results++;
  }

  finalResults = results;
  return results;
}}


