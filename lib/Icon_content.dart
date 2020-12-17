import 'package:flutter/material.dart';
import 'constants.dart';


// ignore: camel_case_types
class icon_content extends StatelessWidget {
  icon_content({@required this.gender,@required this.icon
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
          style: klabelTextstyle ),
      ],
    );
  }
}