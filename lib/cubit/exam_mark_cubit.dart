// cubits/exam_mark_cubit.dart
import 'package:Schoople/cubit/exam_mark_state.dart';
import 'package:Schoople/domain/core/api_end_ponts.dart';
import 'package:Schoople/models/exam_mark.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExamMarkCubit extends Cubit<ExamMarkState> {
  ExamMarkCubit() : super(ExamMarkLoading());

  Future<void> fetchExamMarks(String studentId, String term, String token) async {
    emit(ExamMarkLoading());

    try {
      final response = await http.get(
        Uri.parse('${ApiEndPoints.baseUrl}/api/exam_mark_details?student_id=$studentId&term=$term'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final marks = jsonData.map((e) => ExamMark.fromJson(e)).toList();
        emit(ExamMarkLoaded(marks));
      } else {
        emit(ExamMarkError("Failed to fetch data"));
      }
    } catch (e) {
      emit(ExamMarkError("Error: ${e.toString()}"));
    }
  }
}
