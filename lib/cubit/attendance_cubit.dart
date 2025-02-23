import 'package:Schoople/domain/core/api_end_ponts.dart';
import 'package:Schoople/presentation/login/screen_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/attendance_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoading extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final List<Attendance> attendances;
  AttendanceLoaded(this.attendances);
}

class AttendanceError extends AttendanceState {
  final String message;
  AttendanceError(this.message);
}

class AttendanceCubit extends Cubit<AttendanceState> {
  AttendanceCubit() : super(AttendanceInitial());

  Future<void> fetchAttendance(String token, int studentId,BuildContext context) async {
    emit(AttendanceLoading());
    try {
      final response = await http.get(
        Uri.parse("${ApiEndPoints.baseUrl}/api/attendances/$studentId"),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final List jsonData = json.decode(response.body);
        final List<Attendance> attendances =
            jsonData.map((data) => Attendance.fromJson(data)).toList();
        emit(AttendanceLoaded(attendances));
      } else if (response.statusCode == 401) {
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (cxt1) => ScreenLogin()), (route) => false);
  
      }else {
        emit(AttendanceError('Failed to load attendances.'));
      }
    } catch (e) {
      emit(AttendanceError(e.toString()));
    }
  }
}
