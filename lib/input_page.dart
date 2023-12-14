import 'package:bmi/caculator_brain.dart';
import 'package:bmi/results_page.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'constants.dart';
import 'bottom_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = kGridColor;
  Color femaleColor = kGridColor;
  Gender?
      selectedGender; // that ? makes the propery nullable which means it can not been initializied
  int height = 180;
  int weight = 80;
  int age = 20;

  //0 for male , 1 for female
  // void changeColor(Gender choice) {
  //   if (choice == Gender.male) {
  //     maleColor = Color(0xff00d6cf);
  //     femaleColor = gridColor;
  //   } else if (choice == Gender.female) {
  //     femaleColor = Color(0xff00d6cf);
  //     maleColor = gridColor;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kMainColor,
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Expanded>[
                  Expanded(
                    child: ReusableCard(
                      whatToDo: () => setState(() {
                        //changeColor(Gender.female);
                        selectedGender = Gender.male;
                        print('female choosed');
                      }),
                      colour:
                          selectedGender == Gender.male ? kOnColor : kGridColor,
                      cardWidget:
                          maleandfemale(gender: 'male', icon: Icons.male),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      whatToDo: () => setState(() {
                        //changeColor(Gender.female);
                        selectedGender = Gender.female;
                        print('female choosed');
                      }),
                      colour: selectedGender == Gender.female
                          ? kOnColor
                          : kGridColor,
                      cardWidget:
                          maleandfemale(gender: 'female', icon: Icons.female),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                colour: kGridColor,
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: kLabelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(), style: kNumberStyle),
                        Text('cm', style: kLabelStyle)
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                      activeColor: kOnColor,
                      inactiveColor: Color(0xff565759),
                      min: 120,
                      max: 220,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Expanded>[
                  Expanded(
                    child: ReusableCard(
                      colour: kGridColor,
                      cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kLabelStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Circlebutton(
                                myIcon: Icons.remove,
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Circlebutton(
                                myIcon: Icons.add,
                                onpressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kGridColor,
                      cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kLabelStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Circlebutton(
                                myIcon: Icons.remove,
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Circlebutton(
                                myIcon: Icons.add,
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
                title: 'CALCULATE',
                onpressed: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (BuildContext context,
                          Animation<double> animation1,
                          Animation<double> animation2) {
                        return ResultPage(
                          bmi: calc.calculateBMI(),
                          bodyState: calc.getResult(),
                          note: calc.getInterpretation(),
                        );
                      },
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                })
            //Navigator.of(context).push(_createRoute())),
          ],
        ));
  }
}

// Route _createRoute() {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const ResultPage(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return child;
//     },
//   );
// }

class maleandfemale extends StatelessWidget {
  final IconData icon;
  final String gender;
  const maleandfemale({
    super.key,
    required this.icon,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 80,
        ),
        Text(
          gender,
          style: kLabelStyle,
        )
      ],
    );
  }
}

class Circlebutton extends StatelessWidget {
  late IconData myIcon;
  VoidCallback onpressed;
  Circlebutton({super.key, required this.myIcon, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Icon(myIcon, color: Colors.white),
      fillColor: kTextColor,
      shape: CircleBorder(),
      constraints: BoxConstraints(
          maxHeight: 45, maxWidth: 45, minHeight: 40, minWidth: 40),
      elevation: 3,
    );
  }
}
