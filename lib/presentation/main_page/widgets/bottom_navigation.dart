import 'package:Schoople/presentation/Home/screen_home.dart';
import 'package:Schoople/presentation/attendance/attendance_calendar_page.dart';
import 'package:Schoople/presentation/profile/screen_profile.dart';
import 'package:Schoople/presentation/timetable/timetable_page.dart';
import 'package:flutter/material.dart';


class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0; // Default selected tab

  final List<Widget> _pages = [
    ScreenHome(),
    StudentProfilePage(),
    TimetablePage(),
    AttendanceCalendarPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(  // Smooth transition effect
        duration: const Duration(milliseconds: 500),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,  // Highlight selected icon
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,  // Prevents shifting animation
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "You",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Timetable",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: "Attendance",
          ),
        ],
      ),
    );
  }
}
