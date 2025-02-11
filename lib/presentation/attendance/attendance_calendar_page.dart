import 'package:Schoople/cubit/app_state_cubit.dart';
import 'package:Schoople/cubit/attendance_cubit.dart';
import 'package:Schoople/models/attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AttendanceCalendarPage extends StatefulWidget {
  @override
  _AttendanceCalendarPageState createState() =>
      _AttendanceCalendarPageState();
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
    context.read<AttendanceCubit>().fetchAttendance(token!,studentId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance Calendar')),
      body: BlocBuilder<AttendanceCubit, AttendanceState>(
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
    );
  }

  Map<DateTime, Attendance> _mapAttendanceData(List<Attendance> attendances) {
    final Map<DateTime, Attendance> attendanceMap = {};
    for (var attendance in attendances) {
      final parsedDate = DateFormat('EEE, dd MMM yyyy HH:mm:ss').parse(
        attendance.attendenceDate,
      );
      attendanceMap[DateTime.utc(
          parsedDate.year, parsedDate.month, parsedDate.day)] = attendance;
    }
    return attendanceMap;
  }

  Widget buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2050, 12, 31),
      focusedDay: DateTime.now(),
      calendarFormat: CalendarFormat.month,
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          final attendance = _attendanceMap[day];
          if (attendance != null) {
            return buildColoredDateCell(day, attendance);
          }
          return Center(child: Text('${day.day}'));
        },
      ),
    );
  }

  Widget buildColoredDateCell(DateTime day, Attendance attendance) {
    Color leftColor = Colors.red;
    Color rightColor = Colors.red;

    if (attendance.isPresentMorning && attendance.isPresentAfternoon) {
      leftColor = rightColor = Colors.green;
    } else if (attendance.isPresentMorning) {
      leftColor = Colors.green;
    } else if (attendance.isPresentAfternoon) {
      rightColor = Colors.green;
    } else if (!attendance.isPresentMorning && !attendance.isPresentAfternoon) {
      leftColor = rightColor = Colors.red;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(2),
      ),
      margin: const EdgeInsets.all(4.0),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: leftColor,
                  height: double.infinity,
                ),
              ),
              Expanded(
                child: Container(
                  color: rightColor,
                  height: double.infinity,
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              '${day.day}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
