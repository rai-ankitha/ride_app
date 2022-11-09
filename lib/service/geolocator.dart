
import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

Future<String> getCurrentLocationData() async {
  double lattitude;
  double longitude;
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission != LocationPermission.whileInUse) {
    // LocationPermission permission = await Geolocator.requestPermission();
    await Geolocator.requestPermission();
  }

  Position position = await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.low,
  );
  lattitude = position.latitude;
  longitude = position.longitude;
  // print(position);
  return await getCityNameByLatLon(lat: lattitude, lon: longitude);
}

Future<String> getCityNameByLatLon(
    {required double lat, required double lon}) async {
  var rawData = await http.get(
    Uri.parse(
      "https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$lat&lon=$lon",
    ),
  );
  Map address = jsonDecode(rawData.body)['address'];
  if (address.containsKey('city')) {
    return address['city'];
  } else {
    return address['county'].split()[0];
  }
  //   String city = ['county'].split()[0];
  // return city;
}