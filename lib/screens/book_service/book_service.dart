import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ride_app/model/book_service_model.dart';
import 'package:ride_app/model/prefill_model.dart';
import 'package:ride_app/screens/custom_padding.dart';
import 'package:ride_app/screens/book_service/workstation_suggestion.dart';
import '../../constants.dart';

class ServiceBooking extends StatefulWidget {
  ServiceBooking({Key? key, required this.prefill}) : super(key: key);
  final PrefillModel prefill;

  @override
  State<ServiceBooking> createState() => _ServiceBookingState();
}

class _ServiceBookingState extends State<ServiceBooking> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  String _serviceType = 'General Service';
  TextEditingController vehicleTypeTextfield = TextEditingController();
  String vehicleType = 'Classic 350-black';
  bool textFieldDropdown = false;
  bool submit = false;
  bool isServiceFilled = true;
  bool comments = false;
  List<String> categories = [
    "Free service",
    "General service",
    "Breakdown assistance"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textFieldDropdown = widget.prefill.prefill.length > 1 ? true : false;
    if (!textFieldDropdown) {
      vehicleTypeTextfield.text = widget.prefill.prefill[0].vehicleName!;
      vehicleNumberController.text = widget.prefill.prefill[0].vehicleNumber!;
      vehicleType = vehicleTypeTextfield.text;
    }
    print(widget.prefill.mobile!);
    mobileNumberController.text = widget.prefill.mobile!;
    // vehicleNumberController.addListener(() {
    //   setState(() {
    //     vehicleNumber = vehicleNumberController.text.isNotEmpty;
    //     submit = vehicleNumber && comments;
    //   });
    // });

    commentsController.addListener(() {
      setState(() {
        comments = commentsController.text.isNotEmpty;
        submit = comments;
      });
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFFED863A),
        centerTitle: true,
        title: Text(
          'Book a Service',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 22.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              enabled: false,
              controller: mobileNumberController,
              decoration: InputDecoration(
                labelText: 'Mobile number',
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                labelStyle: GoogleFonts.robotoFlex(
                    color: const Color(0xff9F9F9F), fontSize: 18),
                suffixIcon: const Icon(
                  Icons.edit,
                  color: Color(0xffA6A4A3),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            textFieldDropdown
                ? DropdownButtonFormField(
                    icon: Image.asset("assets/drop_down.png", width: 10),
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      labelText: 'Select vehicle',
                      labelStyle: GoogleFonts.roboto(
                          color: const Color(0xff9F9F9F), fontSize: 18),
                    ),
                    items: [
                      ...widget.prefill.prefill.map(
                        (VehicleDetails item) => DropdownMenuItem<String>(
                          value: item.vehicleName,
                          child: Text(
                            item.vehicleName!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ],
                    // value: vehicleType,
                    onChanged: (value) {
                      print(value);
                      vehicleType = value!;
                      setState(() {
                        vehicleNumberController.text = widget.prefill.prefill
                            .where((element) => element.vehicleName == value)
                            .toList()[0]
                            .vehicleNumber!;
                        // vehicleType = value as String;
                        // vehicleNumberController.text=value;
                      });
                      print("vehicle type is ${value}");
                    },
                    itemHeight: 50,
                  )
                : TextField(
                    enabled: false,
                    controller: vehicleTypeTextfield,
                    decoration: InputDecoration(
                      labelText: 'Vehicle type',
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      labelStyle: GoogleFonts.robotoFlex(
                          color: Color(0xff9F9F9F), fontSize: 18),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              enabled: false,
              controller: vehicleNumberController,
              decoration: InputDecoration(
                labelText: 'Vehicle number',
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                labelStyle: GoogleFonts.robotoFlex(
                    color: Color(0xff9F9F9F), fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField(
              icon: Image.asset("assets/drop_down.png", width: 10),
              decoration: InputDecoration(
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                labelText: 'Service Type',
                labelStyle: GoogleFonts.roboto(
                    color: const Color(0xff9F9F9F), fontSize: 18),
              ),
              items: categories
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                            fontSize: 18, color: Colors.black87),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _serviceType = value as String;
                _serviceType.isNotEmpty? isServiceFilled=true:false;
                 print("service filled ${isServiceFilled}");
                });
              },
              itemHeight: 50,
            ),
            // DropDownTextField(
            //   clearOption: true,
            //   // enableSearch: true,
            //   clearIconProperty: IconProperty(color: Colors.grey),
            //   searchDecoration: const InputDecoration(hintText: "Service type"),
            //   validator: (value) {
            //     if (value == null) {
            //       return "Required field";
            //     } else {
            //       return null;
            //     }
            //   },
            //   dropDownItemCount: 3,
            //   dropDownList: const [
            //     DropDownValueModel(name: 'Free Service', value: "Free Service"),
            //     DropDownValueModel(
            //         name: 'General Service', value: "General Service"),
            //     DropDownValueModel(
            //         name: 'Breakdown assistance',
            //         value: "Breakdown assistance"),
            //   ],
            //   onChanged: (val) {
            //     _serviceType = (val as DropDownValueModel).value;
            //   },
            // ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Comments",
              style: GoogleFonts.robotoFlex(
                  color: Color(0xff4F504F), fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TextField(
                controller: commentsController,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            // ValueListenableBuilder<TextEditingValue>(
            //   valueListenable: _sectorController,
            //   builder: (context, value, child) {
            //     return ElevatedButton(
            //       onPressed: value.text.isNotEmpty ? () {} : null,
            //     child: Text(
            //         'Submit',
            //         style: TextStyle(fontSize: 24,color: Colors.orange),
            //       ),
            //     );
            //   },
            // ),

            Container(
              height: 45,
              width: double.infinity,
              decoration: submit
                  ? kLargeSubmitButtonDecoration
                  : kLargeSubmitButtonDecorationDisabled,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    elevation: MaterialStateProperty.all(0)),
                onPressed: submit? () => submitData() : null,
                child: Text(
                  "FIND A DEALER",
                  style: kLargeSubmitButtonTextDecoration,
                ),
              ),
            ),
          ],
        ),
      ).paddingAll(40, 40, 20, 30),
    );
  }

  submitData() {
    BookServiceModel.mobileNumber = mobileNumberController.text;
    BookServiceModel.vehicleType = vehicleType;
    BookServiceModel.vehicleNumber = vehicleNumberController.text;
    BookServiceModel.serviceType = _serviceType;
    BookServiceModel.comments = commentsController.text;

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WorkstationSuggestion()));
  }
}
