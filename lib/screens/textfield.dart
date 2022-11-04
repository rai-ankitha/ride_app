import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_app/screens/custom_padding.dart';


class MyTextFormField extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  FormFieldValidator<String> callBack;
  String myHintText;
  bool obscure;
  double _padding = 15.0;

  MyTextFormField(
      {required this.textController, required this.callBack, required this.myHintText,required this.obscure});

  @override
  Widget build(BuildContext context) {
    return
      TextFormField(
        controller: textController,
        validator: callBack,
        obscureText: obscure,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          errorStyle: GoogleFonts.roboto(color: Colors.orange),
          hintText:myHintText,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          hintStyle: TextStyle(color: Color(0xff4F504F),fontSize:16),
          border:
          UnderlineInputBorder(),
        ),
      ).paddingAll(10,10,10,10);
  }
}



