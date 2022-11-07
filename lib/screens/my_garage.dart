import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyGarage extends StatefulWidget {
  MyGarage({Key? key}) : super(key: key);

  @override
  State<MyGarage> createState() => _MyGarageState();
}

class _MyGarageState extends State<MyGarage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          alignment: Alignment.center,
          height:250,
          child: SizedBox(
            width:250, height:250, //height and width of guage
            child:SfRadialGauge(
                title: GaugeTitle(text: "Speed Meter"), //title for guage
                enableLoadingAnimation: true, //show meter pointer movement while loading
                animationDuration: 4500, //pointer movement speed
                axes: <RadialAxis>[ //Radial Guage Axix, use other Guage type here
                  RadialAxis(minimum: 0,maximum: 150,
                      ranges: <GaugeRange>[ //Guage Ranges
                        GaugeRange(startValue: 0,endValue: 50, //start and end point of range
                            color: Colors.green, startWidth: 10,endWidth: 10
                        ),
                        GaugeRange(startValue: 50,endValue: 100,color: Colors.orange,startWidth: 10,endWidth: 10),
                        GaugeRange(startValue: 100,endValue: 150,color: Colors.red,startWidth: 10,endWidth: 10)
                        //add more Guage Range here
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(value:80, ) //add needlePointer here
                        //set value of pointer to 80, it will point to '80' in guage
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Container(
                                child: Text('80.0',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold))
                            ),
                            angle: 90,
                            positionFactor: 0.5),
                        //add more annotations 'texts inside guage' here
                      ]
                  )]
            ),
          ),
        ));}}