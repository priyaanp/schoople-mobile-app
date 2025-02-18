// models/exam_mark.dart
class ExamMark {
  final String subjectTitle;
  final double marksObtained;
  final double marksOutOf;
  final String term;
  final double weightage;

  ExamMark({
    required this.subjectTitle,
    required this.marksObtained,
    required this.marksOutOf,
    required this.term,
    required this.weightage,
  });

  factory ExamMark.fromJson(Map<String, dynamic> json) {
    return ExamMark(
      subjectTitle: json['subject_title'],
      marksObtained: json['marks_obtained'].toDouble(),
      marksOutOf: json['marks_out_of'].toDouble(),
      term: json['term'],
      weightage: json['weightage'].toDouble(),
    );
  }
}
