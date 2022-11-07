import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/screens/custom_padding.dart';
import 'package:ride_app/service/direction.dart';

import '../Providers/map_provider.dart';
import '../constants.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController myController;
  bool pauseButton=false;
  Marker? origin;
  Marker? destination;
  DirectionRepository dir=DirectionRepository();
  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons=Set<Polygon> ();
  Set<Polyline> _polylines=Set<Polyline> ();

  List<LatLng> polygonLatLngs = <LatLng>[];
 int _polygonIdCounter=1;
  int _polylineIdCounter=1;


  static const _initialCameraPosition = CameraPosition(
    target: LatLng(13.336817194763675,74.737992486596),
    zoom: 10.0,
  );

  void _onMapCreated(GoogleMapController controller) {
    myController = controller;
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setMarker(LatLng(13.336817194763675,74.737992486596));
    _setMarker(LatLng(12.913909224973084,74.85484793693875));
  }
  void _setMarker(LatLng point){
    setState(() {
      _markers.add(Marker(markerId: MarkerId('marker'),position: point
      ));
    });
  }
  void _setPolygon(){
    final String polygonIdVal='polygon_$_polygonIdCounter';
    _polygonIdCounter++;

    _polygons.add(Polygon(polygonId: PolygonId(polygonIdVal),
    points: polygonLatLngs,
    strokeWidth: 2,
    fillColor: Colors.transparent)
    );
  }
  // void _setPolyline(List<PointLatLng> points){
  //   print(points);
  //   final String polylineIdVal='polyline_$_polylineIdCounter';
  //   _polylineIdCounter++;
  //
  //   _polylines.add(Polyline(polylineId: PolylineId(polylineIdVal),
  //       width: 2,
  //       color:Colors.red ,
  //       points:points.map((point)=>LatLng(point.latitude, point.longitude)).toList()
  //       )
  //   );
  // }
  void _setPolyline(List points){
    print(points);
    final String polylineIdVal='polyline_$_polylineIdCounter';
    _polylineIdCounter++;

    _polylines.add(Polyline(polylineId: PolylineId(polylineIdVal),
        width: 5,
        color:Colors.blue ,
        points:points.map((point)=>LatLng(point["latitude"], point["longitude"])).toList()
    )
    );
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            color: Colors.grey,
            onPressed: () {},
          ),
          backgroundColor: const Color(0xFFffffff),
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/atmMachine.png",
                width: 20,
              ),
              Image.asset(
                "assets/gas-station.png",
                width: 20,
              ),
              Image.asset("assets/bed.png", width: 20),
              Image.asset("assets/restaurant.png", width: 20),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              polylines: _polylines,
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialCameraPosition,
              markers: _markers,
              polygons: _polygons,
              // {
              //   if (origin != null) origin!,
              //   if (destination != null) destination!
              // },
              onTap: (point){
                setState(() {
                  polygonLatLngs.add(point);
                  _setPolygon();
                });
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                // _polylines.clear();
                 dir.getDirections("origin", "estination").then((value) => _setPolyline(value));
                  // _setPolyline(directions['polyline_decoded']);
                },
                child: Image.asset(
                  "assets/chat.png",
                  width: 80,
                ),
              ),
            ).paddingAll(14, 0, 0, 75),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: 40,
                width: 40,
                child: FloatingActionButton(
                  onPressed: () {
                    myController.animateCamera(
                        CameraUpdate.newCameraPosition(_initialCameraPosition));
                  },
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  //materialTapTargetSize: MaterialTapTargetSize.padded,
                  foregroundColor: Colors.black45,
                  backgroundColor: Colors.white,
                  child: const Icon(
                    Icons.gps_fixed,
                    color: Color(0xffA4A4A4),
                  ),
                ),
              ),
            ).paddingAll(14, 15, 0, 175),
          ],
        ),
        bottomNavigationBar: Consumer<MapProvider>(
            builder: (BuildContext context, value, Widget? child) {
          return Container(
            height: 50,
            width: double.infinity,
            decoration: kLargeMapButtonDecoration,
            child: GestureDetector(onTap: (){
              Provider.of<MapProvider>(context, listen: false).toggleIcon();

            },
              child: Center(
                child: value.playIcon,
              ),
            ),
          );
        }),
      ),
    );
  }

  void _addMarker(LatLng pos) {
    if (origin == null || (origin != null && destination != null)) {
      setState(() {
        origin = Marker(
            markerId: MarkerId('origin'),
            infoWindow: InfoWindow(title: 'origin'),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueGreen),
            position: pos);
        destination = null;
      });
    } else {
      setState(() {
        destination = Marker(
            markerId: MarkerId('destination'),
            infoWindow: InfoWindow(title: 'destination'),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
            position: pos);
      });
    }
  }
}
