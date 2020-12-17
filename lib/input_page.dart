import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_content.dart';
import 'CardContainer.dart';
import 'constants.dart';
import 'bmi Calculator.dart';

enum Gender{Male,Female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender;
  int height=180;
  int weight=50;
  int age=19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardContainer(
                      onpress: (){
                        setState(() {
                          selectedgender=Gender.Male;
                        });
                      },
                      colour:selectedgender==Gender.Male ?kactivecardcolor:kinactivecardcolor,
                      cardChild: icon_content(gender: 'Male',icon: FontAwesomeIcons.mars,),
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      onpress: (){
                        setState(() {
                          selectedgender=Gender.Female;
                        });
                      },
                      colour: selectedgender==Gender.Female?kactivecardcolor:kinactivecardcolor,
                      cardChild: icon_content(gender:'FEMALE', icon: FontAwesomeIcons.venus),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CardContainer(
                colour: kactivecardcolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('HEIGHT',
                    style: klabelTextstyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(height.toString(),
                        style: knumberTextStyle),
                        Text('cm',
                        style: klabelTextstyle),

                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor:  Color(0xffEB1555),
                        inactiveTrackColor: Color(0xFF8d8E98),
                        thumbColor:  Color(0xffEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),

                        overlayColor: Color(0x29EB1555),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 26.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min:54.0,
                        max:250.0,
                        onChanged: (double newheight){
                          setState(() {
                            height=newheight.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CardContainer(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT',
                          style: klabelTextstyle,),
                          Text(weight.toString(),
                          style: knumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                              onpressed: (){
                                setState(() {
                                  weight--;
                                });
                              },),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                              onpressed: (){
                                setState(() {
                                  weight++;
                                });
                              },)
                            ],
                          ),
                        ],
                      ),
                      colour: kactivecardcolor,
                    ),
                  ),
                  Expanded(
                    child: CardContainer(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE',style: klabelTextstyle,),
                          Text(age.toString(),style: knumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                              onpressed: (){
                                setState(() {
                                  age--;
                                });
                              },),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                                onpressed: (){
                                  setState(() {
                                    age++;
                                  });
                                } ,),
                            ],
                          ),
                        ],
                      ),
                      colour: kactivecardcolor,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                BMIcalculator calc=BMIcalculator(height: height,weight: weight );
                Navigator.push(context, MaterialPageRoute (builder:(context){return result(bmi: calc.bmicalculator(),resulttext: calc.getresult(),interpretetion: calc.getinterpretetion(),);}));
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 15.0),
                color: Color(0xFFEB1555),
                height: kheightofbasecontainer,
                width: double.infinity,
                child: Center(child: Text(
                    'CALCULATE YOUR BMI',
                style: knavigationTextStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.onpressed});
  final IconData icon;
  Function onpressed;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56.0,height: 56.0),
      shape: CircleBorder() ,
      fillColor: Color(0xFF4C4F5E),

    );
  }
}

