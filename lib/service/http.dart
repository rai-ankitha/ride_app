import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:ride_app/model/book_service_model.dart';

import '../model/prefill_model.dart';

class UserHttp {
  static Future<List> getWorkstations(String search) async {
    final http.Response response = await http.post(
        Uri.parse(
            "https://riding-application.herokuapp.com/api/v1/dealer/searchDealers"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "text": search,
        }));

    return jsonDecode(response.body);
  }

  static Future<PrefillModel> prefillDetails() async {
    // final http.Response response = await http.get(
    //   Uri.parse(
    //       "https://riding-application.herokuapp.com/api/v1/service/prefilledService"),
    //   headers: {
    //     'Authorization':
    //         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTW9iaWxlIjoiOTQ4MTY3NjM0OCIsImlhdCI6MTY2ODA3NTc3MCwiZXhwIjoxNjY4MDc5MzcwfQ._ohHTJFzBMPYEuHhKx0x1W8EhAgWq8nlbPuDZc5Pc8M',
    //     'Content-Type': 'application/json',
    //   },
    // return PrefillModel.fromJson(response.body);
    // );
    Map tmp = {
      "mobile": "9480439398",
      "prefilled": [
        {
          "_id": "636e3481fe21f71e4a0d2e3a",
          "vehicleType": "Continental gt 650",
          "vehicleNumber": "KA 47 MK 7025"
        },
        {
          "_id": "636e34a5fe21f71e4a0d2e3d",
          "vehicleType": "Classic 350",
          "vehicleNumber": "KA 19 MK 9821"
        }
      ]
    };
    // return jsonDecode(response.body);
    return PrefillModel.fromJson(tmp);
    // return tmp;
  }

  static Future<Map> uploadBookingDetails() async {
    final http.Response response = await http.post(
        Uri.parse(
            "https://riding-application.herokuapp.com/api/v1/service/bookService"),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyTW9iaWxlIjoiOTQ4MTY3NjM0OCIsImlhdCI6MTY2ODIzOTcwMiwiZXhwIjoxNjY4MjQzMzAyfQ.f3Rq16o9zcL1Bh5W0q7JE02w60FQpH_xqFELzp8Bkpc ',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "vehicleNumber": BookServiceModel.vehicleNumber,
          "serviceType": BookServiceModel.serviceType,
          "slotDate": BookServiceModel.slotDate,
          "time": BookServiceModel.slotTime,
          "dealer": BookServiceModel.dealerName,
          "city": BookServiceModel.dealerCity,
          "comments": BookServiceModel.comments,
        }));
     print(jsonDecode(response.body));
    return jsonDecode(response.body);

  }
}
