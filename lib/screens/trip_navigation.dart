import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_app/screens/trip_home.dart';
import '../constants.dart';
import 'my_garage.dart';

class AppNavigation extends StatefulWidget {
  AppNavigation({Key? key}) : super(key: key);

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  TextEditingController searchCardController = TextEditingController();

  int bottomIndex = 0;
  final _pageOptions = [
    TripCard(),
    MyGarage(),
    // ActivityPage(),
    // MyProfilePage(),
    // More()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[bottomIndex],
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        focusElevation: 0,
        disabledElevation: 0,
        splashColor: Colors.transparent,
        onPressed: () {},
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        child: Image.asset(
          "assets/add_tripIcon.png",
          width: double.infinity,
        ),
      ),
      bottomNavigationBar: Container(
          height: 65,
          width: double.infinity,
          decoration: kBottomNavigationBar,
          child: BottomNavigationBar(
            selectedItemColor: Colors.white,
            currentIndex: bottomIndex,
            onTap: (index) {
              setState(() {
                bottomIndex = index;
              });
              print(bottomIndex);
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            backgroundColor: Colors.transparent,
            selectedIconTheme: IconThemeData(color: Colors.white),
            items: [
              BottomNavigationBarItem(
                label: 'Trips',
                icon: bottomIndex == 0
                    ? Image.asset(
                        "assets/bottom_navigation/bike.png",
                        color: Colors.white,
                        width: 40,
                      )
                    : Image.asset(
                        "assets/bottom_navigation/bike.png",
                        color: Colors.white.withOpacity(0.4),
                        width: 40,
                      ),
              ),
              BottomNavigationBarItem(
                label: 'My Garage',
                icon: bottomIndex == 1
                    ? Image.asset(
                        "assets/bottom_navigation/wrench.png",
                        color: Colors.white,
                        width: 30,
                      )
                    : Image.asset(
                        "assets/bottom_navigation/wrench.png",
                        color: Colors.white.withOpacity(0.4),
                        width: 30,
                      ),
              ),
              BottomNavigationBarItem(
                label: 'Activities',
                icon: bottomIndex == 2
                    ? Image.asset("assets/bottom_navigation/list.png",
                        color: Colors.white, width: 30)
                    : Image.asset("assets/bottom_navigation/list.png",
                        color: Colors.white.withOpacity(0.4), width: 30),
              ),
              BottomNavigationBarItem(
                label: 'My Profile',
                icon: bottomIndex == 3
                    ? Image.asset("assets/bottom_navigation/user.png",
                        width: 25)
                    : Image.asset(
                        "assets/bottom_navigation/user.png",
                        width: 25,
                        color: Colors.white.withOpacity(0.4),
                      ),
              ),
              BottomNavigationBarItem(
                label: 'More',
                icon: bottomIndex == 4
                    ? Image.asset(
                        "assets/more.png",
                        width: 30,
                        color: Colors.white,
                      )
                    : Image.asset(
                        "assets/more.png",
                        width: 30,
                      ),
              ),
            ],
          )),
    );
  }
}
