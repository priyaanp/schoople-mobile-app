part of 'exam_schedule_cubit.dart';

abstract class ExamScheduleState {}

class ExamScheduleLoading extends ExamScheduleState {}

class ExamScheduleLoaded extends ExamScheduleState {
  final List<ExamSchedule> schedules;
  ExamScheduleLoaded(this.schedules);
}

class ExamScheduleError extends ExamScheduleState {
  final String message;
  ExamScheduleError(this.message);
}