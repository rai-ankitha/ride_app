
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_app/screens/custom_padding.dart';

class ServiceRecords extends StatefulWidget {
  const ServiceRecords({Key? key}) : super(key: key);

  @override
  State<ServiceRecords> createState() => _ServiceRecordsState();
}

class _ServiceRecordsState extends State<ServiceRecords> {
  String? vehicleType;
  String? serviceType;
  List<String> bikeCategories=["Classic 350-Black","Interceptor 650-Black","Bullet 350-Black","Thunderbird 350-Black"];
  List<String> categories = [
    "Free service",
    "General service",
    "Breakdown assistance"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){ Navigator.pop(context);},
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
      body: Column(
        children: [
        DropdownButtonFormField (
            icon: Image.asset("assets/drop_down.png",width: 10),
           decoration: InputDecoration(focusedBorder: const UnderlineInputBorder(
               borderSide: BorderSide(color: Colors.grey)),labelText: 'Vehicle type',labelStyle: GoogleFonts.roboto(color: Color(0xff9F9F9F),fontSize: 18)),
            items: bikeCategories
                .map(
                  (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: GoogleFonts.roboto(color: Colors.black87,fontSize: 18)
                ),
              ),
            )
                .toList(),
            value: vehicleType,
            onChanged: (value) {
              setState(() {
                vehicleType = value as String;
              });

            },
          itemHeight:50,

          ),
          DropdownButtonFormField (
            icon: Image.asset("assets/drop_down.png",width: 10),
            decoration: InputDecoration(focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),labelText: 'Service type',labelStyle: GoogleFonts.roboto(color: Color(0xff9F9F9F),fontSize: 18)),
            items: categories
                .map(
                  (item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                      fontSize: 18, color:Colors.black87),
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
            itemHeight:50,

          ),

        ],
      ).paddingAll(40,40,20,20),
    );
  }
}
