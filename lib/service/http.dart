import 'dart:convert';
import "package:http/http.dart" as http;

class UserHttp {
  static Future<List> getWorkstations(String search) async {
    final http.Response response = await http.post(
        Uri.parse("https://riding-application.herokuapp.com/api/v1/dealer/searchDealers"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "text":search,
        }));
    return jsonDecode(response.body);
  }
  static Future<List> getWorkstationDetails(String mobile) async {
    final http.Response response = await http.post(
        Uri.parse("https://riding-application.herokuapp.com/api/v1/dealer/getDealerInfo"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "dealerPhoneNumber":mobile,
        }));
    return jsonDecode(response.body);
  }

}