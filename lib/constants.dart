import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

BoxDecoration kLargeSubmitButtonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xffED7E2B), Color(0xffF4A264)]),
    boxShadow: const [
      BoxShadow(
        offset: Offset(
          1,
          1,
        ),
        //  blurStyle: BlurStyle.inner,
        color: Colors.black26,
        blurRadius: 1,
        spreadRadius: 1,
      ),
    ]);
TextStyle kLargeSubmitButtonTextDecoration = const TextStyle(
    color: Colors.white, fontWeight: FontWeight.w500, fontSize: 17);


