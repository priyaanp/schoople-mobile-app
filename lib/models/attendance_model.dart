class Attendance {
  final String attendenceDate;
  final bool isPresentMorning;
  final bool isPresentAfternoon;

  Attendance({
    required this.attendenceDate,
    required this.isPresentMorning,
    required this.isPresentAfternoon,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(
      attendenceDate: json['attendence_date'],
      isPresentMorning: json['is_present_morning'],
      isPresentAfternoon: json['is_present_afternoon'],
    );
  }
}
