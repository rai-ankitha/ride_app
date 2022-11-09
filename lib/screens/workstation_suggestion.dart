import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_app/screens/custom_padding.dart';

import '../widgets/workstation_card.dart';

class WorkstationSuggestion extends StatefulWidget {
  const WorkstationSuggestion({Key? key}) : super(key: key);

  @override
  State<WorkstationSuggestion> createState() => _WorkstationSuggestionState();
}

class _WorkstationSuggestionState extends State<WorkstationSuggestion> {
  List<String> suggestion = [];
  TextEditingController workstationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            enabled: true,
            controller: workstationController,
            decoration: InputDecoration(
              // suffixIcon: Image.asset("assets/cancel.png"),

              suffixIcon: IconButton(
                onPressed: () {
                  workstationController.clear();
                  setState(() {
                    suggestion = [];
                  });
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.black45,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              labelText: "Search",
              labelStyle: GoogleFonts.roboto(
                  color: Color.fromRGBO(166, 166, 166, 0.87), fontSize: 14),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromRGBO(194, 188, 188, 0.5),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          ServiceCard()
        ],
      ).paddingAll(20,20,40,20),
    );
  }
}
