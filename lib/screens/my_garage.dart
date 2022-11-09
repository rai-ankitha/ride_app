import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_app/screens/book_service.dart';
import 'package:ride_app/screens/custom_padding.dart';
import 'package:ride_app/screens/owners_manual.dart';
import 'package:ride_app/screens/service_record.dart';

class MyGarage extends StatefulWidget {
  MyGarage({Key? key}) : super(key: key);

  @override
  State<MyGarage> createState() => _MyGarageState();
}

class _MyGarageState extends State<MyGarage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "15 Days",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffE08B4D)),
                ),
                Text(
                  "Next Service due",
                  style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffE08B4D)),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/garage_images/indicator.png",
              ),
            ).paddingAll(20, 20, 0, 0),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceBooking()));
            },
              child: Row(
                children: [
                  Image.asset(
                    "assets/garage_images/book_service.png",
                    width: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Book a Service",
                    style: GoogleFonts.roboto(
                        color: Color(0xff515251),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  )
                ],
              ),
            ).paddingAll(20, 20, 0, 0),
            Divider(
              color: Color(0xff979797),
              thickness: 0.5,
            ),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ServiceRecords()));
            },
              child: Row(
                children: [
                  Image.asset("assets/garage_images/service_records.png",
                      width: 30),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Service Records",
                    style: GoogleFonts.robotoFlex(
                        color: Color(0xff515251),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  )
                ],
              ),
            ).paddingAll(20, 20, 0, 0),
            Divider(
              color: Color(0xff979797),
              thickness: 0.5,
            ),
            InkWell(onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => OwnersManual()));
            },
              child: Row(
                children: [
                  Image.asset("assets/garage_images/owners_manual.png",
                      width: 30),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Owners Manual",
                    style: GoogleFonts.robotoFlex(
                        color: Color(0xff515251),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  )
                ],
              ),
            ).paddingAll(20, 20, 0, 0),
            Divider(
              color: Color(0xff979797),
              thickness: 0.5,
            ),
            InkWell(onTap: (){},
              child: Row(
                children: [
                  Image.asset("assets/garage_images/tool_kit.png", width: 30),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Tool Kit",
                    style: GoogleFonts.robotoFlex(
                        color: Color(0xff515251),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  )
                ],
              ),
            ).paddingAll(20, 20, 0, 0),
            Divider(
              color: Color(0xff979797),
              thickness: 0.5,
            ),
            InkWell(onTap: (){},
              child: Row(
                children: [
                  Image.asset("assets/garage_images/accessories.png",
                      width: 30),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Accessories",
                    style: GoogleFonts.robotoFlex(
                        color: Color(0xff515251),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  )
                ],
              ),
            ).paddingAll(20, 20, 0, 0),
          ],
        ).paddingAll(0, 0, 40, 0));
  }
}
