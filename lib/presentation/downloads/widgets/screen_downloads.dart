import 'package:flutter/material.dart';

import '../../widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List imageList = [
    "https://media.themoviedb.org/t/p/w220_and_h330_face/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/yrpPYKijwdMHyTGIOd1iK1h0Xno.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/oGythE98MYleE6mZlGs5oBGkux1.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(title: 'Downloads')),
      body: ListView(
        children: [
          const Row(
            children: [
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
              Text("Smart Downloads")
            ],
          ),
          const Text('Introducing Downloads for you'),
          const Text(
              'yeah it is working using both gesture detector as well as inkwell but there is a problem: In the output. yeah it is working using both gesture detector as well as inkwell but there is a problem: In the output'),
          Container(
            width: size.width,
            height: size.width,
            color: Colors.white,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.width * 0.4,
                ),
                Container(
                  width: size.width * .3,
                  height: size.width * .5,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: NetworkImage(imageList[0]))),
                )
              ],
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: const Text(
              'Set up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          MaterialButton(
            color: Colors.white,
            onPressed: () {},
            child: const Text(
              'See what you can download',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
