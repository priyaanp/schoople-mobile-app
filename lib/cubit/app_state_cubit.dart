import 'package:bloc/bloc.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit() : super(AppState());

  void setAuthData(String token, int studentId, int academicYearId, int schoolId, int gradeSectionId, int gradeId) {
    emit(state.copyWith(
      token: token,
      studentId: studentId,
      academicYearId: academicYearId,
      schoolId: schoolId,
      gradeSectionId: gradeSectionId,
      gradeId:gradeId
    ));
  }
}

class AppState {
  final String? token;
  final int? studentId;
  final int? academicYearId;
  final int? schoolId;
  final int? gradeSectionId;
  final int? gradeId;

  AppState({
    this.token,
    this.studentId,
    this.academicYearId,
    this.schoolId,
    this.gradeSectionId,
    this.gradeId
  });

  AppState copyWith({
    String? token,
    int? studentId,
    int? academicYearId,
    int? schoolId,
    int? gradeSectionId,
    int? gradeId,
  }) {
    return AppState(
      token: token ?? this.token,
      studentId: studentId ?? this.studentId,
      academicYearId: academicYearId ?? this.academicYearId,
      schoolId: schoolId ?? this.schoolId,
      gradeSectionId: gradeSectionId ?? this.gradeSectionId,
      gradeId: gradeId ?? this.gradeId
    );
  }
}
