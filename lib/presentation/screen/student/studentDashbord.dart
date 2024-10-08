import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat/student_chat.dart';
import 'complains/studentcomplainscreen.dart';
import 'leave/studentLeaveList.dart';
import 'notice/StudentNoticeScreen.dart';
import 'services/studentServices.dart';


class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({Key? key}) : super(key: key);

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    StudentHome(),
    StudentChatScreen(),
    StudentComplainScreen(),
    StudentServicesScreen(),
    StudentApproveDennyLeaveList()
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
              icon: Icon(Icons.chat_outlined),
              label: 'Chat',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.description_outlined),
              label: 'Complain',
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
