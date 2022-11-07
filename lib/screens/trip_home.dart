import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_app/screens/custom_padding.dart';
import '../widgets/custom_card.dart';

class TripCard extends StatefulWidget {
  TripCard({Key? key}) : super(key: key);

  @override
  State<TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  TextEditingController searchCardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:
        Column(
          children: [
            Material(
              elevation: 2.0,
              shadowColor: Color.fromRGBO(194, 188, 188, 0.5),
              child: TextField(
                controller: searchCardController,
                decoration: InputDecoration(
                  labelText: "Search a trip",
                  labelStyle: GoogleFonts.roboto(
                      color: Color.fromRGBO(166, 166, 166, 0.87), fontSize: 14),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(194, 188, 188, 0.5))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: Colors.white, width: 4.0)),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Color(0xff989898),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: 3,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return CustomCard(
                      text: "Ankitha",
                      ontap: () {},
                    );
                  }),
            ),
            // SizedBox(
            //   width: 60,
            //   height: 60,
            //   child: FittedBox(
            //     child: FloatingActionButton(
            //       backgroundColor: Colors.blue,
            //       onPressed: () {},
            //       child: Image.asset(
            //         'assets/add_tripIcon.png',
            //         scale: 2.5,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ).paddingAll(20, 20, 80, 20),

    );

  }
}
