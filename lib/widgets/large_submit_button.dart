import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class LargeSubmitButton extends StatefulWidget {
  String text;
  Function ontap;
  LargeSubmitButton({required this.text, required this.ontap});

  @override
  State<LargeSubmitButton> createState() => _LargeSubmitButtonState();
}

class _LargeSubmitButtonState extends State<LargeSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.ontap(),
      child: Container(
        height: 45,
        width: 282,
        decoration: kLargeSubmitButtonDecoration,
        child: Center(
          child: Text(
            "${widget.text}",
            style: kLargeSubmitButtonTextDecoration,
          ),
        ),
      ),
    );
  }
}