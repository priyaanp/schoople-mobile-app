import 'package:flutter/material.dart';

import '../Home/screen_home.dart';
import '../downloads/widgets/screen_downloads.dart';
import '../profile/screen_profile.dart';
import '../search/screen_search.dart';
import 'widgets/bottom_nav.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    StudentProfilePage(),
    StudentProfilePage(),
    ScreenSearch(),
    ScreenDownloads(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationWidgets(),
    );
  }
  
}
