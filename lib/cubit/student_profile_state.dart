
// Define the state class using Equatable for easy comparison
import 'package:equatable/equatable.dart';

abstract class StudentProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

// Initial state before any data is loaded
class StudentProfileInitial extends StudentProfileState {}

// State while loading student profile
class StudentProfileLoading extends StudentProfileState {}

// State when student profile is successfully loaded
class StudentProfileLoaded extends StudentProfileState {
  final Map<String, dynamic> studentData;

  StudentProfileLoaded(this.studentData);

  @override
  List<Object?> get props => [studentData];
}

// State when there is an error fetching the profile
class StudentProfileError extends StudentProfileState {
  final String message;

  StudentProfileError(this.message);

  @override
  List<Object?> get props => [message];
}
