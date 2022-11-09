import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ride_app/screens/book_service.dart';
import 'package:ride_app/screens/google_map.dart';
import 'package:ride_app/screens/invite_people_page.dart';
import 'package:ride_app/screens/reset_page.dart';
import 'package:ride_app/screens/search_destination.dart';
import 'package:ride_app/screens/success_page.dart';
import 'package:ride_app/screens/timeline.dart';
import 'package:ride_app/screens/trip_home.dart';
import 'package:ride_app/screens/trip_navigation.dart';

import 'Providers/invite_provider.dart';
import 'Providers/map_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
        providers: [
          ChangeNotifierProvider(create: (context) => InviteProvider()),
          ChangeNotifierProvider(create: (context) => MapProvider()),
        ]);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            TextFormField(
              controller: controller,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AppNavigation()));
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => SearchDestination(controller:controller)));
        },
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
