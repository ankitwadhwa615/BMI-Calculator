import 'package:flutter/material.dart';

const labelTextstyel=TextStyle(
  color: Color(0xFF8D8E98),
  fontSize: 18.0,
);
class Icon_content extends StatelessWidget {
  Icon_content({@required this.gender,@required this.icon
  });
  final IconData icon;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(gender,
          style: labelTextstyel ),
      ],
    );
  }
}