import 'dart:io';

import 'package:intl/intl.dart';

class ExamSchedule {
  final int id;
  final String term;
  final String subject;
  final DateTime examDate;

  ExamSchedule({
    required this.id,
    required this.term,
    required this.subject,
    required this.examDate,
  });

  factory ExamSchedule.fromJson(Map<String, dynamic> json) {
    return ExamSchedule(
      id: json['id'],
      term: json['term'],
      subject: json['subject'],
      examDate: HttpDate.parse(json['exam_date']),
    );
  }
    String get formattedDateTime {
    return DateFormat('dd MMM yyyy, hh:mm a').format(examDate);
  }
}