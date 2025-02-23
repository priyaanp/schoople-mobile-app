import 'package:Schoople/cubit/app_state_cubit.dart';
import 'package:Schoople/domain/core/api_end_ponts.dart';
import 'package:Schoople/models/exam_schedule_model.dart';
import 'package:Schoople/presentation/login/screen_login.dart';
import 'package:Schoople/presentation/main_page/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'exam_schedule_state.dart';

class ExamScheduleCubit extends Cubit<ExamScheduleState> {
  ExamScheduleCubit() : super(ExamScheduleLoading());

  Future<void> fetchExamSchedules(BuildContext context) async {
    try {
      final String token = context.read<AppStateCubit>().state.token ?? "";
      final int gradeId = context.read<AppStateCubit>().state.gradeId ?? 0;

      final response = await http.get(
        Uri.parse("${ApiEndPoints.baseUrl}/api/exam-schedules?grade_id=$gradeId"),
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<ExamSchedule> schedules =
            data.map((json) => ExamSchedule.fromJson(json)).toList();
        emit(ExamScheduleLoaded(schedules));
      } else if (response.statusCode == 401) {
        indexChangeNotifier.value = 0;
        Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (cxt1) => ScreenLogin()), (route) => false);
        
      }else {
        emit(ExamScheduleError('Failed to load exam schedules'));
      }
    } catch (e) {
      emit(ExamScheduleError(e.toString()));
    }
  }
}