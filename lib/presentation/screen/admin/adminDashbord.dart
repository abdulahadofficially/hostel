import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'complaint/AdmincomplaintScreen.dart';
import 'leave/AdminLeave.dart';
import 'notice/adminNotice.dart';
import 'service/AdminServices.dart';


class AdminDashbordScreen extends StatefulWidget {
  const AdminDashbordScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashbordScreen> createState() => _AdminDashbordScreenState();
}

class _AdminDashbordScreenState extends State<AdminDashbordScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    AdminHome(),
    AdminComplaintScreen(),
    AdminServicesScreen(),
    AdminLeaveScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 10,
          currentIndex: _selectedIndex,
          selectedIconTheme: IconThemeData(color: Colors.blue.shade900),
          selectedLabelStyle: TextStyle(
              color: Colors.blue.shade900, fontWeight: FontWeight.bold),
          selectedItemColor: Colors.blue.shade900,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              label: 'Complaint',
              backgroundColor: Colors.green,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.wrench),
              label: 'Services',
              backgroundColor: Colors.purple,
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person_crop_circle_badge_minus),
              label: 'Leave',
              backgroundColor: Colors.pink,
            ),
          ]),
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
    );
  }
}
