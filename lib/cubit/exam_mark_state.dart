// cubits/exam_mark_state.dart
import 'package:Schoople/models/exam_mark.dart';

abstract class ExamMarkState {}

class ExamMarkLoading extends ExamMarkState {}

class ExamMarkLoaded extends ExamMarkState {
  final List<ExamMark> marks;
  ExamMarkLoaded(this.marks);
}

class ExamMarkError extends ExamMarkState {
  final String message;
  ExamMarkError(this.message);
}
