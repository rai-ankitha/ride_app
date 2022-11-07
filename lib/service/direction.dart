import 'dart:convert';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class DirectionRepository{

  Future<http.Response> getData(city)
  {
     var result=http.get(Uri.parse("https://api.tomtom.com/routing/1/calculateRoute/13.336817194763675,74.737992486596:12.913909224973084,74.85484793693875/json?key=sC9cDEhhsj0O9fCVgUp0kZYia2IaGm7L"));
  return result;
  }

  Future getDirections(String origin,String destination)async {
   final String _baseUrl='https://api.tomtom.com/routing/1/calculateRoute/13.336817194763675,74.737992486596:12.913909224973084,74.85484793693875/json?key=sC9cDEhhsj0O9fCVgUp0kZYia2IaGm7L';
  var response=await http.get(Uri.parse(_baseUrl));
  var json=jsonDecode(response.body);
 //print(json);
//  var results={
//    'polyline':json['routes'][0]['legs'][0]['points'],
// 'polyline_decoded':PolylinePoints().decodePolyline(json['routes'][0]['legs'][0]['points'])
//  };
//print(results);

return json['routes'][0]['legs'][0]['points'];
  }

//   static const String _baseUrl='https://maps.googleapis.com/maps/api/directions/json?';
//   final Dio _dio;
//
//   DirectionRepository({Dio dio}) :_dio=dio ?? Dio();
//
//   Future<Directions> getDirections({
//   required LatLng origin,
//   required LatLng destination,})async{
//
//   final response=await _dio.get{
//     _baseUrl,
//   queryParameters:{
//       'origin':'${origin.latitude},${origin.longitude}',
//     'destination':'${destination.latitude},${destination.longitude}',
//     'key':"AIzaSyC0WM5NN5lrIELpRfT6OfU3spw9xZqkpqU"
//   });
//
// if(response.statusCode==200){
//   return Directions.fromMap(response.data);
//     }
//     }
// }

}