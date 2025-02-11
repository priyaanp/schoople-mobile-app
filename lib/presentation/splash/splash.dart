import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../login/screen_login.dart';
import '../main_page/screen_main_page.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            'assets/images/logo.png',
            height: 300,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 1));
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (cnt) => ScreenLogin(),
    ));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPref = await SharedPreferences.getInstance();
    // _sharedPref.setBool(SAVE_KEY_NAME, true);
    final _userLoggedIn = _sharedPref.getBool("SAVE_KEY_NAME");
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (cxt1) => ScreenMainPage()));
    }
  }
}
