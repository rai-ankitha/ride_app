import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MapProvider extends ChangeNotifier {
bool button=true;
 Image playIcon=Image.asset("assets/pause.png",width: 20,);

 toggleIcon(){
   playIcon=button? Image.asset("assets/pause.png",width: 20,):Image.asset("assets/play.png",width: 20,color: Colors.white,);
   button=!button;
   notifyListeners();
 }
}