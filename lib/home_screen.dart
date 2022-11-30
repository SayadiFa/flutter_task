import 'package:flutter/material.dart';
import 'package:flutter_task/app_main_function.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final intToSumToController = TextEditingController();
  final intThresholdPowerController = TextEditingController();

  late int answer = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dart Task'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text('X: the integer to sum to (1 =< X =< 1000)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),

                    TextFormField(

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
                        controller: intToSumToController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 0.6,
                              fontSize: 12),
                          // errorBorder: OutlineInputBorder(
                          //   borderSide: BorderSide( color: AppTheme.appMainColor, width: 2),
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          filled: true,
                        ),
                        validator: (value) {
                          double parsedValue = double.parse(value ?? '0.0');
                          int intValue = parsedValue.toInt();
                          // print(intValue);
                          if (value == null) {
                            return 'please enter required field';
                          } else if (intValue < 1 || intValue > 1000) {
                            return 'The input value X is not 1 =< X =< 1000';
                          }
                          return null;
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                          'N: the integer power to raise numbers to (2 =< N =< 10)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                    TextFormField(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        controller: intThresholdPowerController,
                        keyboardType: const TextInputType.numberWithOptions(signed: false, decimal: false),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          errorStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              height: 0.6,
                              fontSize: 12),
                          // errorBorder: OutlineInputBorder(
                          //   borderSide: BorderSide( color: AppTheme.appMainColor, width: 2),
                          //   borderRadius: BorderRadius.circular(20),
                          // ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          filled: true,
                        ),
                        validator: (value) {
                          double parsedValue = double.parse(value ?? '0.0');
                          int intValue = parsedValue.toInt();

                          if (value == null) {
                            return 'please enter required field';
                          } else if (intValue < 2 || intValue > 10) {
                            return 'The input value N is not 2 =< N =< 10';
                          }
                          return null;
                        }),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    constraints: BoxConstraints.tightFor(
                      width: 150,
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4)),
                    child: TextButton(
                      onPressed: () {

                        if (_formKey.currentState!.validate()) {
                          final mainFunction = MainFunction();
                          answer = mainFunction.checkRecursive(
                              int.parse(intToSumToController.text),
                              int.parse(intThresholdPowerController.text),
                              1,
                              0);
                          print(answer);
                          setState(() {});
                        }
                      },
                      child: const Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                              letterSpacing: 2.5,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(answer.toString()),
              )
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
