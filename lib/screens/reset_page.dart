import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/screens/custom_padding.dart';
import 'package:ride_app/screens/success_page.dart';
import 'package:ride_app/screens/textfield.dart';
import 'package:ride_app/widgets/large_submit_button.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
                child: Center(child: Image.asset("assets/reset_page.png"))),
            const Center(
                child: Text(
              "Reset Password",
              style: TextStyle(
                color: Color(0xff575656),
                fontSize: 20,
              ),
            )).paddingAll(30, 0, 40, 20),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextFormField(
                      textController: _newPasswordController,
                      obscure: true,
                      myHintText: 'New Password',
                      callBack: (password) {
                        return passwordValadition(password);
                      }),
                  MyTextFormField(
                    textController: _confirmPasswordController,
                    obscure: true,
                    myHintText: 'Confirm Password',
                    callBack: (password) {
                      if (password == null || password.isEmpty) {
                        return "Password required";
                      } else{
                        return _newPasswordController.text == password
                          ? null
                          : 'Password mismatch';
                    }}
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: LargeSubmitButton(
                          text: "Reset",
                          ontap: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SuccessPage(
                                          title:
                                              "Your password has been successfully changed")));
                            }
                          })).paddingAll(10, 10, 0, 0)
                ],
              ),
            ),
          ],
        ).paddingAll(20, 20, 50, 0),
      ),
    );
  }
}

passwordValadition(value) {
  if (value == null || value.isEmpty) {
    return "Password required";
  } else if (!RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
      .hasMatch(value)) {
    return "Enter a strong password";
  } else {
    return null;
  }
}
