// screens/exam_marks_page.dart
import 'package:Schoople/cubit/app_state_cubit.dart';
import 'package:Schoople/cubit/exam_mark_cubit.dart';
import 'package:Schoople/cubit/exam_mark_state.dart';
import 'package:Schoople/models/exam_mark.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class ExamMarksPage extends StatefulWidget {
  @override
  _ExamMarksPageState createState() => _ExamMarksPageState();
}

class _ExamMarksPageState extends State<ExamMarksPage> {
  String selectedTerm = "Midterm 1"; // Default Term
  late String studentId;
  late String token;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final appState = context.read<AppStateCubit>().state;
    studentId = appState.studentId.toString();
    token = appState.token!;
    fetchExamMarks();
  }

  void fetchExamMarks() {
    context.read<ExamMarkCubit>().fetchExamMarks(studentId, selectedTerm, token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report Card",
                style: GoogleFonts.inter(
                fontSize: 24,
                color: const Color(0xFF0278A9),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
      ),
      backgroundColor: Color(0xFF00A1B6), 
      ),
      
      
      body: SafeArea(
        child: Container(
                        decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight, // Approximate for 242 degrees
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFF0276A8), // Start color
                    Color(0xFF00A1B6), // End color
                  ],
                  stops: [0.1113, 1.0], // Corresponding stops
                ),
              ),
          child: Column(
            children: [
              _buildFilterDropdown(),
              Expanded(
                child: BlocBuilder<ExamMarkCubit, ExamMarkState>(
                  builder: (context, state) {
                    if (state is ExamMarkLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ExamMarkLoaded) {
                      if(state.marks.isEmpty){
                        return const Center(child: Text("No marks available"));
                      }                     
                      return _buildReportCard(state.marks);
                    } else if (state is ExamMarkError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(child: Text("No marks available"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterDropdown() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedTerm,
            isExpanded: true,
            style: const TextStyle(color: Colors.black, fontSize: 16),
            dropdownColor: Colors.white,
            onChanged: (newValue) {
              setState(() {
                selectedTerm = newValue!;
                fetchExamMarks();
              });
            },
            items: ["Midterm 1","First","Midterm 2", "Second", "Midterm 3","Third"]
                .map((term) => DropdownMenuItem(
                      value: term,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(term),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildReportCard(List<ExamMark> marks) {
    double totalMarksObtained = marks.fold(0, (sum, mark) => sum + mark.marksObtained);
    double totalMarksOutOf = marks.fold(0, (sum, mark) => sum + mark.marksOutOf);
    double percentage = (totalMarksObtained / totalMarksOutOf) * 100;
    String finalGrade = _calculateGrade(percentage);
    Color gradeColor = finalGrade == "E" ? Colors.red : Colors.black;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [                    
                  Table(
                    border: TableBorder.all(color: Colors.grey),
                    columnWidths: const {
                      0: FlexColumnWidth(2), // Subject
                      1: FlexColumnWidth(1), // Marks Obtained
                      2: FlexColumnWidth(1), // Total Marks
                      3: FlexColumnWidth(1), // Grade
                    },
                    children: [
                      _buildTableHeader(),
                      for (var mark in marks) _buildTableRow(mark),
                      _buildTotalRow(totalMarksObtained, totalMarksOutOf, percentage, finalGrade, gradeColor),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TableRow _buildTableHeader() {
    return TableRow(
      decoration: const BoxDecoration(color: Colors.blueAccent),
      children: [
        _buildTableCell("Subject", isHeader: true),
        _buildTableCell("Marks", isHeader: true),
        _buildTableCell("Total", isHeader: true),
        _buildTableCell("Grade", isHeader: true),
      ],
    );
  }

  TableRow _buildTableRow(ExamMark mark) {
    double percentage = (mark.marksObtained / mark.marksOutOf) * 100;
    String grade = _calculateGrade(percentage);
    Color textColor = grade == "E" ? Colors.red : Colors.black;

    return TableRow(
      children: [
        _buildTableCell(mark.subjectTitle),
        _buildTableCell(mark.marksObtained.toString()),
        _buildTableCell(mark.marksOutOf.toString()),
        _buildTableCell(grade, textColor: textColor),
      ],
    );
  }

  TableRow _buildTotalRow(double obtained, double total, double percentage, String grade, Color gradeColor) {
    return TableRow(
      decoration: BoxDecoration(color: Colors.green[100]),
      children: [
        _buildTableCell("Total", isHeader: true),
        _buildTableCell(obtained.toStringAsFixed(2), isHeader: true),
        _buildTableCell(total.toStringAsFixed(2), isHeader: true),
       _buildTableCell("$grade (${percentage.toStringAsFixed(1)}%)", isHeader: true, textColor: gradeColor), // Rounded %
      ],
    );
  }

  Widget _buildTableCell(String text, {bool isHeader = false, Color textColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          fontSize: isHeader ? 14 : 14,
          color: textColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  String _calculateGrade(double percentage) {
    if (percentage >= 90) return "A+";
    if (percentage >= 80) return "A";
    if (percentage >= 70) return "B+";
    if (percentage >= 60) return "B";
    if (percentage >= 50) return "C+";
    if (percentage >= 40) return "C";
    if (percentage >= 30) return "D+";
    if (percentage >= 20) return "D";
    return "E"; // Less than 20
  }
}
