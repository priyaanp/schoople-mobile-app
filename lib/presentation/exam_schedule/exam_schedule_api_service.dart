import 'dart:convert';
import 'package:Schoople/domain/core/api_end_ponts.dart';
import 'package:Schoople/models/exam_schedule_model.dart';
import 'package:http/http.dart' as http;


class ExamScheduleApiService {
  final String baseUrl;
  final String token;

  ExamScheduleApiService({required this.baseUrl, required this.token});

  Future<List<ExamSchedule>> fetchExamSchedules(String gradeId) async {
      
      final response = await http.get(
        Uri.parse("${ApiEndPoints.baseUrl}/api/exam-schedules?grade_id=1"),
        headers: {"Authorization": "Bearer $token"},
      );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ExamSchedule.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load exam schedules');
    }
  }
}