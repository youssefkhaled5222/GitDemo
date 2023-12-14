import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';
import 'results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   'home': (context) => InputPage(),
      //   'result': (context) => ResultPage(),
      // },
      theme: ThemeData(
        scaffoldBackgroundColor: kMainColor,
        colorScheme: ColorScheme.fromSwatch(
            // accentColor: Color(0xff302e38),
            ),
      ),
      //initialRoute: 'home',
      home: InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
