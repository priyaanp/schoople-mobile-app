import 'dart:convert';
import 'package:Schoople/cubit/app_state_cubit.dart';
import 'package:Schoople/domain/core/api_end_ponts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class TimetablePage extends StatefulWidget {
  const TimetablePage({Key? key}) : super(key: key);

  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday"
  ];
  late String selectedDay;
  List<dynamic> timetableData = [];

  @override
  void initState() {
    super.initState();
    selectedDay = _getCurrentDay();
    fetchTimetableData(selectedDay);
  }

  String _getCurrentDay() {
    String currentDay = DateFormat('EEEE').format(DateTime.now());
    return days.contains(currentDay) ? currentDay : "Monday";
  }

  Future<void> fetchTimetableData(String day) async {
    try {
      final state = context.read<AppStateCubit>().state;
      final token = state.token;
      final academicYearId = state.academicYearId;
      final schoolId = state.schoolId;
      final gradeSectionId = state.gradeSectionId;

      final response = await http.get(
        Uri.parse(
            "${ApiEndPoints.baseUrl}/api/timetable-details?academic_year_id=${academicYearId}&school_id=${schoolId}&school_grade_section_id=${gradeSectionId}"),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          timetableData =
              data.where((entry) => entry["day_name"] == day).toList();
        });
      } else {
        throw Exception("Failed to load timetable");
      }
    } catch (error) {
      print("Error fetching timetable: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Timetable",
          style: GoogleFonts.inter(
            fontSize: 24,
            color: const Color(0xFF0278A9),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color(0xFF00A1B6),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Day Selection Tabs
            Container(
              height: 50,
              color: Colors.blueAccent.withOpacity(0.2),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDay = day;
                        fetchTimetableData(selectedDay);
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: selectedDay == day
                            ? Colors.blueAccent
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          day,
                          style: TextStyle(
                            color: selectedDay == day
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        
            // Timetable List
            Expanded(
              child: timetableData.isEmpty
                  ? const Center(child: Text("No timetable available"))
                  : ListView.builder(
                      itemCount: timetableData.length,
                      itemBuilder: (context, index) {
                        final entry = timetableData[index];
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: ListTile(
                            leading: Text(
                              entry["subject"],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            trailing: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  entry["time_slot"],
                                  style: const TextStyle(fontSize: 14),
                                ),
                                Text(
                                  entry["staff"],
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
