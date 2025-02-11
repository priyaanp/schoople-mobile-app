import 'dart:convert';

import 'package:Schoople/cubit/app_state_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/api_end_ponts.dart';

import '../main_page/screen_main_page.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class ScreenLogin extends StatefulWidget {
  ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  bool hidden = true;
  @override
  void initState() {
    hidden = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final padding = MediaQuery.of(context).padding;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: size.height,
            child: SafeArea(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(
                              0.98, -0.35), // Equivalent to 168 degrees
                          end: Alignment(1.5,
                              0.8), // Adjust to match the gradient direction
                          colors: [
                            Color(0xFF93d1d7),
                            Color(0xFF177db4),
                          ],
                          stops: [
                            0.3539,
                            0.983
                          ], // Corresponds to your percentages
                        ),
                      ),
                      // child: Stack(

                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //  crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Welcome to',
                                style: GoogleFonts.inter(
                                  fontSize: 27,
                                  color: const Color(0xFF21929C),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'SCHOOPLE',
                                style: TextStyle(
                                  fontFamily: 'Corporatus',
                                  color: Color(0xFF0E6999),
                                  fontSize: 36,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xFFB1D7DC),
                                ),
                                //  width: size.width - 50,
                                height: 250,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 0),
                                      child: TextFormField(
                                        scrollPadding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom),
                                        controller: _usernameController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Rounded corners
                                            borderSide: const BorderSide(
                                              color: Color(
                                                  0xFFEDF1F3), // Border color
                                              width: 1.0, // Border width
                                            ),
                                          ),
                                          hintText: 'Username',
                                          suffixIcon: IconButton(
                                              onPressed: () => setState(() {}),
                                              icon: const Icon(Icons.person)),
                                        ),
                                        style: TextStyle(color: Colors.black),
                                        // validator: (value) {
                                        //   if (value == null || value.isEmpty) {
                                        //     return 'Value is empty';
                                        //   } else {
                                        //     return null;
                                        //   }
                                        // },
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 0),
                                      child: TextFormField(
                                        obscureText: hidden,
                                        controller: _passwordController,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Rounded corners
                                            borderSide: const BorderSide(
                                              color: Color(
                                                  0xFFEDF1F3), // Border color
                                              width: 1.0, // Border width
                                            ),
                                          ),
                                          hintText: 'Password',
                                          suffixIcon: IconButton(
                                              onPressed: () => setState(() {
                                                    hidden = !hidden;
                                                  }),
                                              icon: const Icon(Icons
                                                  .remove_red_eye_outlined)),
                                        ),
                                        style: TextStyle(color: Colors.black),
                                        // validator: (value) {
                                        //   if (value == null || value.isEmpty) {
                                        //     return 'Value is empty';
                                        //   } else {
                                        //     return null;
                                        //   }
                                        // },
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              text: 'Forgot password?',
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () => print('click'),
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                color: const Color(0xFF0F6A99),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 0, 15, 0),
                                      child: MaterialButton(
                                        color: const Color(0xFF006093),
                                        minWidth: double.infinity,
                                        height: 50,
                                        padding: const EdgeInsets.all(8.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        onPressed: () {
                                          // _formKey.currentState!.validate();
                                          // checkLogin(context);
                                          setState(() {
                                            _isLoading =
                                                true; // Set loading state to true
                                          });
                                          //  if (_formKey.currentState!.validate()) {
                                          checkLogin(context);
                                          //  _login(context);
                                          // } else {
                                          //  print('Data is empty');
                                          // setState(() {
                                          //  _isLoading =
                                          //      false; // Set loading state to true
                                          // });
                                          //  }
                                        },
                                        child: Text('Submit',
                                            style: GoogleFonts.inter(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            )),
                                      ),
                                    ),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Visibility(
                                    //       visible: !_isDataMatch,
                                    //       child: Text(
                                    //         'User and password does not match',
                                    //         style: TextStyle(color: Colors.red),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //  ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    Map<String, String> headers = {"Content-Type": "application/json"};
    String body = json.encode({"username": _username, "password": _password});
    try {
      // if (response.statusCode == 200 || response.statusCode == 201) {
      // final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      //  Profile profile = Profile.fromJson(responseJson);
      print(_username);
      print(_password);

      if (_username.isEmpty || _password.isEmpty) {
        setState(() {
          _isLoading = false; // Set loading state to true
        });
        ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
          content: const Text('Please enter username and password'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: keyboardHeight),
        ));
      } else {
        //  String url = 'http://127.0.0.1:5000/api/login';
        Map<String, String> headers = {"Content-Type": "application/json"};
        String body = json.encode({
          "username": _usernameController.text,
          "password": _passwordController.text
        });

        try {
          final response = await http.post(
              Uri.parse("${ApiEndPoints.baseUrl}api/login"),
              headers: headers,
              body: body);
          print(response.statusCode);
          if (response.statusCode == 200) {
            var data = json.decode(response.body);
            String token = data['token'];
            int studentId = data['student_data']['student_id'];
            int academicyearId = data['student_data']['active_academic_year_id'];
            int schoolId = data['student_data']['school_id'];
            int gradeSectionId = data['student_data']['school_grade_section_id'];
            print("gradeSectionId");
            print(gradeSectionId);
            context.read<AppStateCubit>().setAuthData(
                token, studentId, academicyearId, schoolId, gradeSectionId);
            // final Map<String, dynamic> jsonResponse = json.decode(response.body);
            // final String token = jsonResponse['token'];
            // final studentData = jsonResponse['student_data'];

            if (token.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context1) => ScreenMainPage()),
              );
            }
          } else {
            setState(() {
              _isLoading = false; // Set loading state to true
            });
            ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
              content: const Text('Please check your username and password'),
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(bottom: keyboardHeight),
            ));
          }
        } catch (e) {
          print(e.toString());
          print(e);
          _showErrorDialog1("Unable to connect to the server.");
        } finally {
          setState(() {
            _isLoading = false;
          });
        }
      }
      // } else {
      // print(response.statusCode);
      // }
    } catch (_) {}
  }

  void _login(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    String url = 'http://127.0.0.1:5000/api/login';
    Map<String, String> headers = {"Content-Type": "application/json"};
    String body = json.encode({
      "username": _usernameController.text,
      "password": _passwordController.text
    });

    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);
        final String token = jsonResponse['token'];
        final studentData = jsonResponse['student_data'];

        if (token.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context1) => ScreenMainPage()),
          );
        }
      } else {
        _showErrorDialog("Invalid login credentials.");
      }
    } catch (e) {
      print(e.toString());
      print(e);
      _showErrorDialog1("Unable to connect to the server.");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Login Error"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Okay00"),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog1(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Login Error"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Okay11"),
          ),
        ],
      ),
    );
  }
}
