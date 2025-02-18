import 'package:Schoople/cubit/app_state_cubit.dart';
import 'package:Schoople/cubit/attendance_cubit.dart';
import 'package:Schoople/models/attendance_model.dart';
import 'package:Schoople/presentation/main_page/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AttendanceCalendarPage extends StatefulWidget {
  @override
  _AttendanceCalendarPageState createState() => _AttendanceCalendarPageState();
}

class _AttendanceCalendarPageState extends State<AttendanceCalendarPage> {
  late Map<DateTime, Attendance> _attendanceMap;

  @override
  void initState() {
    super.initState();
    _attendanceMap = {};

    final state = context.read<AppStateCubit>().state;
    final token = state.token;
    final studentId = state.studentId;
    context.read<AttendanceCubit>().fetchAttendance(token!, studentId!);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Attendance",
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
          child: BlocBuilder<AttendanceCubit, AttendanceState>(
            builder: (context, state) {
              if (state is AttendanceLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AttendanceError) {
                return Center(child: Text(state.message));
              } else if (state is AttendanceLoaded) {
                _attendanceMap = _mapAttendanceData(state.attendances);
                return buildCalendar();
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  /// Converts attendance data from API response to a DateTime map
  Map<DateTime, Attendance> _mapAttendanceData(List<Attendance> attendances) {
    final Map<DateTime, Attendance> attendanceMap = {};
    for (var attendance in attendances) {
      final parsedDate = DateFormat('EEE, dd MMM yyyy HH:mm:ss').parse(
        attendance.attendenceDate,
      );
      attendanceMap[
              DateTime.utc(parsedDate.year, parsedDate.month, parsedDate.day)] =
          attendance;
    }
    return attendanceMap;
  }

  /// Builds the calendar UI
  Widget buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2025, 1, 1),
      lastDay: DateTime.utc(2050, 12, 31),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.month,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return buildDateCell(day);
        },
        todayBuilder: (context, day, focusedDay) {
          return buildDateCell(day, isToday: true);
        },
      ),
    );
  }

  /// Builds individual date cells with attendance logic
  Widget buildDateCell(DateTime day, {bool isToday = false}) {
    final attendance = _attendanceMap[day];

    // If no attendance exists for the date, keep the default style (no color)
    if (attendance == null) {
      return Container(
        margin: const EdgeInsets.all(4.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter, // Approximate for 242 degrees
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF00A1B6), // Start color
              Color(0xFF0276A8), // End color
            ],
            stops: [0.1113, 1.0], // Corresponding stops
          ),
          border: isToday
              ? Border.all(color: Colors.blue, width: 3)
              : null, // Add blue border for today
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          '${day.day}',
          style: TextStyle(
            color:
                isToday ? Colors.blue : Colors.black, // Highlights today’s date
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
    }

    Color leftColor = Colors.red; // Default to absent
    Color rightColor = Colors.red;

    if (attendance.isPresentMorning && attendance.isPresentAfternoon) {
      leftColor = rightColor = Colors.green; // Fully present
    } else if (attendance.isPresentMorning) {
      leftColor = Colors.green;
    } else if (attendance.isPresentAfternoon) {
      rightColor = Colors.green;
    } else if (!attendance.isPresentMorning && !attendance.isPresentAfternoon) {
      leftColor = rightColor = Colors.red;
    }

    return Container(
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        border: isToday
            ? Border.all(color: Colors.blue, width: 3)
            : null, // Add a blue border if today
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          // Left half - Morning
          Positioned.fill(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: leftColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: rightColor,
                  ),
                ),
              ],
            ),
          ),
          // Date Number
          Center(
            child: Text(
              '${day.day}',
              style: const TextStyle(
                color: Colors.white, // Ensures visibility
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
