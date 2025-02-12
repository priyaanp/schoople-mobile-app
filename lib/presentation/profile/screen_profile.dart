import 'package:Schoople/core/baseurl/base_url.dart';
import 'package:Schoople/cubit/app_state_cubit.dart';
import 'package:Schoople/domain/core/api_end_ponts.dart';
import 'package:Schoople/presentation/login/screen_login.dart';
import 'package:Schoople/presentation/main_page/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class StudentProfilePage extends StatefulWidget {
  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  Map<String, dynamic>? studentData;

  @override
  void initState() {
    super.initState();
    fetchStudentData();
  }

  Future<void> fetchStudentData() async {
    final state = context.read<AppStateCubit>().state;
   final token = state.token;
    final studentId = state.studentId;

    try {
      var response = await http.get(
        Uri.parse("${ApiEndPoints.baseUrl}/api/student-data/$studentId"),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        setState(() {
          studentData = json.decode(response.body)['student_data'];
        });
      } else {
        _showErrorDialog("Failed to fetch student data.");
      }
    } catch (e) {
      _showErrorDialog("An error occurred while fetching data.");
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            fontSize: 24,
            color: const Color(0xFF0278A9),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFF00A1B6),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight, // Approximate for 242 degrees
            end: Alignment.topLeft,
            colors: [
              Color(0xFF0276A8), // Start color
              Color(0xFF00A1B6), // End color
            ],
            stops: [0.1113, 1.0], // Corresponding stops
          ),
        ),
        child: SafeArea(
          child: ListView(
            //  shrinkWrap: true,

            children: [
              const SizedBox(
                height: 25,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    // alignment: Alignment.center,
                    children: [
                      Container(
                        width: 180, // Increase width for outer border
                        height: 180, // Increase height for outer border
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Color(0xFF1EBBFF),
                              width: 3), // Outer border
                        ),
                        child: CircleAvatar(
                          radius: 169 / 2 + 5,
                          backgroundColor: Color(0xFF0276A8),
                          child: CircleAvatar(
                            radius: 169 / 2 + 5,
                            backgroundImage: NetworkImage(
                                '$kImageUrl${studentData?['photo']}'),
                            onBackgroundImageError: (_, __) =>
                                null, // fallback in case of image error
                            child: ClipOval(
                              child: Image.network(
                                '$kImageUrl${studentData?['photo']}',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/logo.png', // Path to your default image
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${studentData?['first_name']} ${studentData?['last_name']}',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(
                    //width: size.width,
                    height: size.height - 100,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${studentData?['first_name']} ${studentData?['last_name']}',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: const Color(0xFF0278A9),
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Table(
                          // border: TableBorder.all(), // Add border to the table
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    'Class',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: const Color(0xFF494949),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text(
                                    'Division',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: const Color(0xFF494949),
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    'Plus one science',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(2.0),
                                  child: Text(
                                    'A',
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          indent: 20, // Indent from the left
                          endIndent: 20,
                          color: Color(0xFFBEBCBC), // Indent from the right
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly, // Optional: for even spacing
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      color: Colors.red,
                                      height: 25,
                                      child: Center(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              'Nationality',
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                color: const Color(0xFF494949),
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      color: Colors.green,
                                      height: 25,
                                      child: Center(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Indian',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      color: Colors.blue,
                                      height: 25,
                                      child: Center(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Date of Birth',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: const Color(0xFF494949),
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      color: Colors.yellow,
                                      height: 25,
                                      child: Center(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '22-05-2015',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .end, // Optional: for even spacing
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      color: Colors.red,
                                      height: 35,
                                      child: Center(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(
                                              'Mother Tongue',
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                color: const Color(0xFF494949),
                                                fontWeight: FontWeight.w400,
                                              ),
                                              // textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      color: Colors.green,
                                      height: 25,
                                      child: Center(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Malayalam',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      color: Colors.blue,
                                      height: 25,
                                      child: Center(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'Blood',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: const Color(0xFF494949),
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                      color: Colors.yellow,
                                      height: 25,
                                      child: Center(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            'O +ve',
                                            style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(children: [
                          DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                const TabBar(
                                  tabs: [
                                    Tab(text: 'Address'),
                                    Tab(text: 'Parent Details'),
                                  ],
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Color(0xFF0278A9),
                                  indicatorColor: Color(0xFF0278A9),
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  indicatorWeight: 3,
                                ),
                                SizedBox(
                                  height: 200,
                                  child: TabBarView(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Admission Number: 123456',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: const Color(0xFF0278A9),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Admission Number: 123456',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: const Color(0xFF0278A9),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Admission Number: 123456',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: const Color(0xFF0278A9),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Admission Number: 123456',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: const Color(0xFF0278A9),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Admission Number: 123456',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: const Color(0xFF0278A9),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Admission Number: 4534534',
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              color: const Color(0xFF0278A9),
                                              fontStyle: FontStyle.normal,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, top: 15.00, right: 15.00),
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    signout(context);
                  },
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  signout(BuildContext cxt) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    indexChangeNotifier.value = 0;
    Navigator.of(cxt).pushAndRemoveUntil(
        MaterialPageRoute(builder: (cxt1) => ScreenLogin()), (route) => false);
  }
}
