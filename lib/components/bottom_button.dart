import 'package:flutter/material.dart';

import '../constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({this.ontap, required this.ButtonTitle});
  final Function()? ontap;
  final String ButtonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(
              ButtonTitle,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
            )),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
      ),
    );
  }
}