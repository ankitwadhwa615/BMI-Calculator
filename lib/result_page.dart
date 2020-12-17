import 'package:bmi_calculator/CardContainer.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class result extends StatelessWidget {
  @override
  result({@required this.bmi,@required this.resulttext,@required this.interpretetion});
  final String bmi;
  final String resulttext;
  final String interpretetion;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text('BMI CALCULATOR        ')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 22),
              child: Text(
                'Your Result',
                style: ktitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardContainer(
              colour: kactivecardcolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(resulttext.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: kresultTextstyle),
                  Text(bmi,
                  style: kBMITextStyle,
                  textAlign: TextAlign.center,),
                  Text(interpretetion,
                  style: ksuggestionTextstyle,
                  textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 15.0),
              color: Color(0xFFEB1555),
              height: kheightofbasecontainer,
              width: double.infinity,
              child: Center(child: Text(
                  'RE-CALCULATE',
                  style: knavigationTextStyle),
              ),
            ),
          ),
        ],
      )
    );
  }
}
