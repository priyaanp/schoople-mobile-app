import 'package:bloc/bloc.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit() : super(AppState());

  void setAuthData(String token, int studentId, int academicYearId, int schoolId, int gradeSectionId) {
    emit(state.copyWith(
      token: token,
      studentId: studentId,
      academicYearId: academicYearId,
      schoolId: schoolId,
      gradeSectionId: gradeSectionId,
    ));
  }
}

class AppState {
  final String? token;
  final int? studentId;
  final int? academicYearId;
  final int? schoolId;
  final int? gradeSectionId;

  AppState({
    this.token,
    this.studentId,
    this.academicYearId,
    this.schoolId,
    this.gradeSectionId,
  });

  AppState copyWith({
    String? token,
    int? studentId,
    int? academicYearId,
    int? schoolId,
    int? gradeSectionId,
  }) {
    return AppState(
      token: token ?? this.token,
      studentId: studentId ?? this.studentId,
      academicYearId: academicYearId ?? this.academicYearId,
      schoolId: schoolId ?? this.schoolId,
      gradeSectionId: gradeSectionId ?? this.gradeSectionId,
    );
  }
}
