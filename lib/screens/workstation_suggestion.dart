import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_app/model/workstation_model.dart';
import 'package:ride_app/screens/custom_padding.dart';

import '../service/http.dart';
import '../widgets/workstation_card.dart';

class WorkstationSuggestion extends StatefulWidget {
  const WorkstationSuggestion({Key? key}) : super(key: key);

  @override
  State<WorkstationSuggestion> createState() => _WorkstationSuggestionState();
}

class _WorkstationSuggestionState extends State<WorkstationSuggestion> {
  List<WorkstationModel> workstations = [];
  TextEditingController workstationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              enabled: true,
              controller: workstationController,
              onChanged: (value) {
                if (value.isEmpty) {
                  workstations.clear();
                  setState(() {

                  });
                } else {
                  UserHttp.getWorkstations(workstationController.text)
                      .then((value) {
                    workstations.clear();

                    for (var e in value) {
                      workstations.add(WorkstationModel.fromJson(e));

                    }

                    setState(() {});
                  });
                }
              },
              decoration: InputDecoration(
                // suffixIcon: Image.asset("assets/cancel.png"),

                suffixIcon: IconButton(
                  onPressed: () {
                    workstationController.clear();
                    workstations = [];
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black45,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                labelText: "Search",
                labelStyle: GoogleFonts.roboto(
                    color: Color.fromRGBO(166, 166, 166, 0.87), fontSize: 14),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromRGBO(194, 188, 188, 0.5),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ...workstations.map((e) {

             return  ServiceCard(
                  workstation: e,

             );
            })
          ],
        ),
      ).paddingAll(20, 20, 40, 20),
    );
  }
}
