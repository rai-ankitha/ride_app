import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_app/screens/custom_padding.dart';
import 'package:ride_app/screens/timeline.dart';

import '../constants.dart';
import '../model/milestone_record.dart';

class ServiceRecords extends StatefulWidget {
  const ServiceRecords({Key? key}) : super(key: key);

  @override
  State<ServiceRecords> createState() => _ServiceRecordsState();
}

class _ServiceRecordsState extends State<ServiceRecords> {
  int _index = 0;

  String? vehicleType;
  String? serviceType;
  List<String> bikeCategories = [
    "Classic 350-Black",
    "Interceptor 650-Black",
    "Bullet 350-Black",
    "Thunderbird 350-Black"
  ];
  List<String> categories = [
    "Free service",
    "General service",
    "Breakdown assistance"
  ];
  List<MilestoneRecord> records = [
    MilestoneRecord(id: 1, from: "Udupi", to: "Goa", distance: "300km"),
    MilestoneRecord(id: 2, from: "Udupi", to: "Goa", distance: "300km"),
    MilestoneRecord(id: 3, from: "Udupi", to: "Goa", distance: "300km"),
    MilestoneRecord(id: 4, from: "Udupi", to: "Goa", distance: "300km"),
    MilestoneRecord(id: 5, from: "Udupi", to: "Goa", distance: "300km")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFFED863A),
        centerTitle: true,
        title: Text(
          'Service Records',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          DropdownButtonFormField(
            icon: Image.asset("assets/drop_down.png", width: 10),
            decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: 'Vehicle type',
                labelStyle:
                    GoogleFonts.roboto(color: Color(0xff9F9F9F), fontSize: 18)),
            items: bikeCategories
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                        style: GoogleFonts.roboto(
                            color: Colors.black87, fontSize: 18)),
                  ),
                )
                .toList(),
            value: vehicleType,
            onChanged: (value) {
              setState(() {
                vehicleType = value as String;
              });
            },
            itemHeight: 50,
          ),
          DropdownButtonFormField(
            icon: Image.asset("assets/drop_down.png", width: 10),
            decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: 'Service type',
                labelStyle:
                    GoogleFonts.roboto(color: Color(0xff9F9F9F), fontSize: 18)),
            items: categories
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style:
                          const TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ),
                )
                .toList(),
            value: serviceType,
            onChanged: (value) {
              setState(() {
                serviceType = value as String;
              });
            },
            itemHeight: 50,
          ),
          SizedBox(
            height: 20,
          ),
          TimeLine(details: records.first,first: true,),
          ...records.sublist(1,records.length-1).map((e) => TimeLine(details: e)),
          // ...records.map((e) => TimeLine(details: e)),
          TimeLine(details: records.last,last: true,),
          Container(
            height: 50,
            width: double.infinity,
            decoration: kLargeMapButtonDecoration,
            child: GestureDetector(onTap: (){

            },
              child: Center(
                child: Text("GO",style: GoogleFonts.roboto(color: Colors.white),),
              ),
            ),
          )
        ],
      )).paddingAll(10, 10, 20, 20),
    );
  }
}
