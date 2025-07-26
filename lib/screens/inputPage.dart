import 'package:BMI_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';

enum Gender {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  InputPage({key});

  @override
  State<InputPage> createState() => _InputPageState();
}

int height = 180;
int weight = 50;
int age = 19;

Gender selectedGender = Gender.none;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: ReusableContainer(
                  colour: selectedGender == Gender.male
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild:
                      IconContent(icon: FontAwesomeIcons.mars, lable: 'MALE'),
                ),
              )),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableContainer(
                  colour: selectedGender == Gender.female
                      ? activeCardColor
                      : inactiveCardColor,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    lable: 'FEMALE',
                  ),
                ),
              )),
            ],
          )),
          Expanded(
              child: ReusableContainer(
            colour: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: klabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kNumberTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white70,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0)),
                  child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      }),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableContainer(
                colour: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'WEIGHT',
                      style: klabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                weight--;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                weight++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: ReusableContainer(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: klabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: () {
                              setState(() {
                                age--;
                              });
                            }),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: () {
                              setState(() {
                                age++;
                              });
                            })
                      ],
                    )
                  ],
                ),
                colour: activeCardColor,
              )),
            ],
          )),
          BottomButton(
              ButtonTitle: 'CALCULATE',
              ontap: () {
                CalculatorBrain calc = new CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(bmiResult: calc.calculateBMI(), resultText: calc.getResult(), interpretation: calc.getInterpretation(),),
                  ),
                );
              }),
        ],
      ),
    );
  }
}




