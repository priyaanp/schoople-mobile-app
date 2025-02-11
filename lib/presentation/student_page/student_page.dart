import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StudentPage extends StatefulWidget {
  final String token;
  final int studentId;

  const StudentPage({Key? key, required this.token, required this.studentId}) : super(key: key);

  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  Map<String, dynamic>? studentData;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchStudentData();
  }

  Future<void> fetchStudentData() async {
    final url = Uri.parse('http://127.0.0.1:5000/api/student-data/${widget.studentId}');
    try {
      final response = await http.get(url, headers: {
        'Authorization': 'Bearer ${widget.token}'
      });

      if (response.statusCode == 200) {
        setState(() {
          studentData = json.decode(response.body)['student_data'];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load student data';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching data';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Profile'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : studentData != null
              ? Column(
                  children: [
                    _buildProfileHeader(),
                    Expanded(child: _buildTabs()),
                  ],
                )
              : Center(child: Text(errorMessage)),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage('http://127.0.0.1:5000/images/${studentData!['photo']}'),
        ),
        Text(
          '${studentData!['first_name']} ${studentData!['last_name']}',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text('Academic Year: ${studentData!['active_academic_year']}'),
        Text('Admission Number: ${studentData!['admission_number']}'),
      ],
    );
  }

  Widget _buildTabs() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Address'),
              Tab(text: 'Parent Details'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildAddressTab(),
                _buildParentDetailsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Permanent Address:'),
          Text(studentData!['permanent_address']),
          const SizedBox(height: 10),
          const Text('Communication Address:'),
          Text(studentData!['communication_address']),
        ],
      ),
    );
  }

  Widget _buildParentDetailsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Father Name:'),
          Text(studentData!['father_name']),
          const SizedBox(height: 10),
          const Text('Mother Name:'),
          Text(studentData!['mother_name']),
          const SizedBox(height: 10),
          const Text('Father Email:'),
          Text(studentData!['father_email']),
          const SizedBox(height: 10),
          const Text('Mother Email:'),
          Text(studentData!['mother_email']),
        ],
      ),
    );
  }
}
