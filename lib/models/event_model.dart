import 'dart:io';
import 'package:intl/intl.dart';  // ✅ Import intl package

class EventModel {
  final String title;
  final String description;
  final DateTime date;
  final String color;

  EventModel({
    required this.title,
    required this.description,
    required this.date,
    required this.color,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'],
      description: json['description'] ?? "",
      date: HttpDate.parse(json['date']), // ✅ Fix: Parse RFC 1123 date format
      color: json['color'],
    );
  }

  // ✅ Function to format date & time in 12-hour format
  String get formattedDateTime {
    return DateFormat('dd MMM yyyy, hh:mm a').format(date);
  }
}
