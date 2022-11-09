import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/milestone_record.dart';

class TimeLine extends StatelessWidget {
  int index = 0;
  TimeLine({Key? key, required this.details,this.first=false,this.last=false}) : super(key: key);
  final MilestoneRecord details;
  bool first;
  bool last;

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Column(
            children: [
              Column(
                children: [first
                      ? Container(
                          width: 1,
                          height: 60,
                          color: Colors.transparent,
                        )
                      : Container(
                          width: 1,
                          height: 60,
                          color: Color(0xffED7E2B),
                        ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffED7E2B),
                            offset: Offset(
                              0,
                              0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                        color: Color(0xffD7762D),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Icon(
                      Icons.gps_not_fixed_outlined,
                      color: Color(0xffED7E2B),
                      size: 8,
                    ),
                  ),
                  last
                      ? Container(
                          width: 1,
                          height: 80,
                          color: Colors.transparent,
                        )
                      : Container(
                          width: 1,
                          height: 80,
                          color: Color(0xffED7E2B),
                        ),
                ],
              ),
            ],
          ),
          Container(
            // color: Colors.red,
            // height: 250,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(
                      0,
                      0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width * 0.75,
                    // width: double.infinity,
                    // width: MediaQuery.of(context).size.width*0.8,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFBE7d9),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              'Milestone ${details.id}',
                              style: GoogleFonts.roboto(
                                color: const Color(0xffED7E2B),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                               details.from.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Color.fromRGBO(58, 57, 57, 0.87)),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      details.distance.toString(),
                                      style: GoogleFonts.roboto(
                                          color: Color(0xff979797), fontSize: 15),
                                    ),
                                    Container(
                                      width: 120,
                                      height: 1,
                                      color: Color(0xff979797),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                details.to.toString(),
                                style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: Color.fromRGBO(58, 57, 57, 0.87)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    ;
  }
}
