import 'package:Schoople/cubit/exam_schedule_cubit.dart';
import 'package:Schoople/models/exam_schedule_model.dart';
import 'package:Schoople/presentation/main_page/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamSchedulePage extends StatefulWidget {
  ExamSchedulePage({required this.type});
  final int type;

  @override
  State<ExamSchedulePage> createState() => _ExamSchedulePageState();
}

class _ExamSchedulePageState extends State<ExamSchedulePage> {
  @override
  Widget build(BuildContext context) {
    context.read<ExamScheduleCubit>().fetchExamSchedules(context);

    return CustomScaffold(
      title: "Exan Schedule",
      type:1,
      body: SafeArea(
        child: Container(
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
          child: BlocBuilder<ExamScheduleCubit, ExamScheduleState>(
            builder: (context, state) {
              if (state is ExamScheduleLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ExamScheduleLoaded) {
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);

                final upcoming = _groupByTerm(
                  state.schedules
                      .where((e) => _isUpcoming(e, today, state.schedules))
                      .toList(),
                );
                final finished = _groupByTerm(
                  state.schedules
                      .where((e) => !_isUpcoming(e, today, state.schedules))
                      .toList(),
                );

                return DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(text: 'Upcoming'),
                          Tab(text: 'Finished'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _buildScheduleList(
                                upcoming, Colors.green, Colors.green.shade100),
                            _buildScheduleList(
                                finished, Colors.red, Colors.red.shade100),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is ExamScheduleError) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text('No schedules found'));
            },
          ),
        ),
      ),
    );
  }

  bool _isUpcoming(
      ExamSchedule schedule, DateTime today, List<ExamSchedule> schedules) {
    return schedule.examDate.isAfter(today) ||
        _hasFutureExams(schedule.term, today, schedules);
  }

  bool _hasFutureExams(
      String term, DateTime today, List<ExamSchedule> schedules) {
    final latestExamDate = _latestExamDateForTerm(term, schedules);
    return latestExamDate != null && latestExamDate.isAfter(today);
  }

  DateTime? _latestExamDateForTerm(String term, List<ExamSchedule> schedules) {
    final exams = schedules.where((e) => e.term == term).toList();
    if (exams.isEmpty) return null;
    exams.sort((a, b) => b.examDate.compareTo(a.examDate));
    return exams.first.examDate;
  }

  Widget _buildScheduleList(
      Map<String, List<ExamSchedule>> schedules, Color color, Color shade100) {
    if (schedules.isEmpty) {
      return const Center(child: Text('No schedules available'));
    }
    return ListView(
      children: schedules.entries.map((entry) {
        return Card(
          color: shade100,
          child: ExpansionTile(
            title: Text(entry.key,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                )),
            children: entry.value.map((schedule) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      schedule.subject,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF0278A9),
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    trailing: Column(
                      children: [
                        Icon(Icons.calendar_today, color: color),
                        Text(
                          schedule.formattedDateTime,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF0278A9),
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Color(0xFFBEBCBC),
                  ),
                ],
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }

  Map<String, List<ExamSchedule>> _groupByTerm(List<ExamSchedule> schedules) {
    final Map<String, List<ExamSchedule>> grouped = {};
    for (var schedule in schedules) {
      grouped.putIfAbsent(schedule.term, () => []).add(schedule);
    }
    return grouped;
  }
}
