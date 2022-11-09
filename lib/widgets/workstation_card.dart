import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import '../constants.dart';

class ServiceCard extends StatefulWidget {
  const ServiceCard({Key? key}) : super(key: key);

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  IconData? _selectedIcon;
  double _userRating = 4;
  bool _isVertical = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.only(right: 20, left: 20, top: 20),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(
              0,
              0,
            ),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ), //BoxShadow
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tune Motors, Udupi",
                style: TextStyle(color: Color(0xcfED7E2B), fontSize: 19),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Authorised serviece center", style: kServiceCardTextStyle),
              SizedBox(
                height: 5,
              ),
              Text("+91 44 46292229", style: kServiceCardTextStyle),
              SizedBox(
                height: 5,
              ),
              RatingBarIndicator(
                rating: _userRating,
                itemBuilder: (context, index) => Icon(
                  _selectedIcon ?? Icons.star,
                  color: Color(0xffF3DA3B),
                ),
                itemCount: 5,
                itemSize: 22.0,
                unratedColor: Color(0xffd3d3d3),
                direction: _isVertical ? Axis.vertical : Axis.horizontal,
              ),
            ],
          ),
          Text("4km", style: kServiceCardTextStyle)
        ],
      ),
    );
  }
}