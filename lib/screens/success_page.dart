import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/screens/invite_people_page.dart';
import 'package:ride_app/screens/custom_padding.dart';


import '../widgets/large_submit_button.dart';

class SuccessPage extends StatefulWidget {
  SuccessPage({super.key, required this.title});
  String title;

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 80,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Color(0xff575656),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: 300,
                child: Center(child: Image.asset("assets/success.png"))),
            const Text(
              "Success!!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff4F504F),
                fontSize: 22,
              ),
            ).paddingAll(30, 0, 40, 20),
            SizedBox(
                width: 215,
                child: Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xff575656),
                    fontSize: 14,
                  ),
                )),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                width: double.infinity,
                child: LargeSubmitButton(
                    text: "Done",
                    ontap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => InvitePage()));
                    })).paddingAll(20, 20, 0, 0)
          ],
        ).paddingAll(20, 20, 50, 0),
      ),
    );
  }
}
