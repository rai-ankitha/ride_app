import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../service/autocomplete_api_client.dart';

class SearchDestination extends StatefulWidget {
  const SearchDestination({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;
  @override
  State<SearchDestination> createState() => _SearchDestinationState();
}

class _SearchDestinationState extends State<SearchDestination> {
  List<String> suggestion = [];
  HttpService service = HttpService();
  TextEditingController destinationController = TextEditingController();

  getSuggestionData(location) async {
    await service.getSuggestions(location).then((value) {
      suggestion.clear();
      for (var item in jsonDecode(value.body)["results"]) {
        var fullName = item['text']['primary'] as String;
        int index = fullName.indexOf(',');
        suggestion.add(fullName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                enabled: true,
                controller: destinationController,
                decoration: InputDecoration(
                  // suffixIcon: Image.asset("assets/cancel.png"),

                  suffixIcon: IconButton(
                      onPressed: () {
                        destinationController.clear();
                       setState(() {
                         suggestion=[];
                       });
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.black45,
                      )),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: "Where to?",
                  labelStyle: GoogleFonts.roboto(
                      color: Color.fromRGBO(166, 166, 166, 0.87), fontSize: 14),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(194, 188, 188, 0.5))),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height - 420,
                  child: FutureBuilder<dynamic>(
                      future: getSuggestionData(destinationController.text),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting)
                          return Center(child: CircularProgressIndicator());
                        else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return ListView.builder(
                              padding: const EdgeInsets.all(0),
                              itemCount: suggestion.length,
                              itemBuilder: (BuildContext ctxt, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    destinationController.text =
                                        suggestion[index];
                                    widget.controller.text = suggestion[index];
                                  },
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: Image.asset(
                                          "assets/mapIcon.png",
                                          width: 20,
                                        ),
                                        title: Text(
                                          suggestion[index],
                                          style: GoogleFonts.roboto(),
                                        ),
                                        subtitle: Text(
                                          suggestion[index],
                                          style: GoogleFonts.roboto(),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Divider(
                                        color: Color(0xff979797),
                                        thickness: 0.5,
                                      ),
                                    ],
                                  ),
                                );
                              });
                        } else
                          return Text("ERROR");
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
