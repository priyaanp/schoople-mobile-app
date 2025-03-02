import 'package:Schoople/core/baseurl/base_url.dart';
import 'package:Schoople/cubit/app_state_cubit.dart';
import 'package:Schoople/cubit/student_profile_state.dart';
import 'package:Schoople/domain/core/api_end_ponts.dart';
import 'package:Schoople/presentation/login/screen_login.dart';
import 'package:Schoople/presentation/main_page/widgets/bottom_nav.dart';
import 'package:Schoople/presentation/main_page/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class StudentProfileCubit extends Cubit<StudentProfileState> {
  StudentProfileCubit() : super(StudentProfileInitial());

  void fetchStudentProfile(BuildContext context) async {
    if (state is StudentProfileLoading) return; // Prevent duplicate calls
    try {
      emit(StudentProfileLoading());
      final studentData = await getStudentProfile(context);
      emit(StudentProfileLoaded(studentData));
    } catch (e) {
      emit(StudentProfileError("Failed to load profile"));
    }
  }

  Future<Map<String, dynamic>> getStudentProfile(BuildContext context) async {
    final state = context.read<AppStateCubit>().state;
    final token = state.token;
    final studentId = state.studentId;
    final response = await http.get(
      Uri.parse("${ApiEndPoints.baseUrl}/api/student-data/$studentId"),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['student_data'];
    } else {
      throw Exception("Failed to fetch student data");
    }
  }
}

// Cubit for managing student profile state

class StudentProfilePage extends StatefulWidget {
  StudentProfilePage({required this.type});
  final int type;
  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    context.read<StudentProfileCubit>().fetchStudentProfile(context);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Profile",
      type: widget.type,
      body: SafeArea(
        child: BlocBuilder<StudentProfileCubit, StudentProfileState>(
          builder: (context, state) {
            if (state is StudentProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is StudentProfileError) {
              return Center(child: Text(state.message));
            } else if (state is StudentProfileLoaded) {
              final studentData = state.studentData; // Extract the student data

              return SingleChildScrollView(
                child: Column(
                  children: [
                    // Profile Header
                    // Profile Header
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: SizedBox(
                        width: double.infinity, // Ensures full width
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment
                                    .topRight, // Approximate for 242 degrees
                                end: Alignment.topLeft,
                                colors: [
                                  Color(0xFF0276A8), // Start color
                                  Color(0xFF00A1B6), // End color
                                ]),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
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
                                  backgroundColor: const Color(0xFF0276A8),
                                  child: ClipOval(
                                    child: Image.network(
                                      '$kImageUrl${studentData?['photo']}',
                                      width: 169,
                                      height: 169,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/images/logo.png', // Fallback image
                                          width: 169,
                                          height: 169,
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${studentData['first_name']} ${studentData['middle_name']} ${studentData['last_name']}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign
                                    .center, // Ensure text stays centered
                              ),
                              const SizedBox(height: 8),
                              Chip(
                                backgroundColor: Colors.white,
                                label: Text(
                                  "Academic Year: ${studentData['active_academic_year_start']} - ${studentData['active_academic_year_end']}",
                                  style: TextStyle(
                                      color: Colors.blue.shade600,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Details Section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              buildInfoRow("Admission Number",
                                  studentData['admission_number']),
                              buildInfoRow("Class", studentData['grade']),
                              buildInfoRow("Section", studentData['section']),
                              buildInfoRow(
                                  "Blood Group", studentData['blood_group']),
                              buildInfoRow("Date of Birth", studentData['dob']),
                              buildInfoRow(
                                  "Nationality", studentData['nationality']),
                              buildInfoRow("Gender", studentData['gender']),
                              TabBar(
                                controller: _tabController,
                                indicatorColor: Colors.blue,
                                labelColor: Colors.blue,
                                unselectedLabelColor: Colors.grey,
                                tabs: const [
                                  Tab(text: "Address"),
                                  Tab(text: "Parent Details"),
                                ],
                              ),
                              SizedBox(
                                height: 250, // Set a fixed height
                                child: Container(
                                  color: Colors.white,
                                  child: TabBarView(
                                    controller: _tabController,
                                    children: [
                                      AddressTab(studentData),
                                      ParentDetailsTab(studentData),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Tab Bar

                    const SizedBox(height: 20),

                    // Logout Button
                    TextButton.icon(
                      onPressed: () {
                        signout(context);
                      },
                      icon: const Icon(Icons.logout, color: Colors.red),
                      label: const Text("Log Out",
                          style: TextStyle(color: Colors.red)),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              );
            }
            return const Center(child: Text("No student data available"));
          },
        ),
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF494949),
                fontWeight: FontWeight.w400,
              )),
          Text(value,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              )),
        ],
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

class AddressTab extends StatelessWidget {
  final Map<String, dynamic> studentData;
  const AddressTab(this.studentData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("📍 Permanent Address",
              style: GoogleFonts.inter(
                fontSize: 16,
                color: const Color(0xFF494949),
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(height: 5),
          Text(studentData['permanent_address'],
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(height: 15),
          Text("📍 Communication Address",
              style: GoogleFonts.inter(
                fontSize: 16,
                color: const Color(0xFF494949),
                fontWeight: FontWeight.w400,
              )),
          const SizedBox(height: 5),
          Text(studentData['communication_address'],
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              )),
        ],
      ),
    );
  }
}

class ParentDetailsTab extends StatelessWidget {
  final Map<String, dynamic> studentData;
  const ParentDetailsTab(this.studentData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildInfoRow("Father Name", studentData['father_name']),
          buildInfoRow("Father Email", studentData['father_email']),
          buildInfoRow("Father Mobile", studentData['father_mobile']),
          buildInfoRow("Mother Name", studentData['mother_name']),
          buildInfoRow("Mother Email", studentData['mother_email']),
          buildInfoRow("Mother Mobile", studentData['mother_mobile']),
        ],
      ),
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: const Color(0xFF494949),
                fontWeight: FontWeight.w400,
              )),
          Text(value,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              )),
        ],
      ),
    );
  }
}
