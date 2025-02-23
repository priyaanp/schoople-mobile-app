import 'package:Schoople/presentation/attendance/attendance_calendar_page.dart';

import 'package:Schoople/presentation/timetable/timetable_page.dart';
import 'package:flutter/material.dart';

import '../Home/screen_home.dart';

import '../profile/screen_profile.dart';

import 'widgets/bottom_nav.dart';

class ScreenMainPage extends StatefulWidget {
  ScreenMainPage({super.key});

  @override
  State<ScreenMainPage> createState() => _ScreenMainPageState();
}

class _ScreenMainPageState extends State<ScreenMainPage> {
  final List<Widget> _pages = [
    ScreenHome(),
    StudentProfilePage(type: 2),
    TimetablePage(type: 2,),
    AttendanceCalendarPage(type: 2,),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: indexChangeNotifier,
            builder: (context, int index, _) {
              return _pages[index];
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
}
