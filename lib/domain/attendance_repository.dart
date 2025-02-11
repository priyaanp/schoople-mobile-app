import 'dart:convert';
import 'package:http/http.dart' as http;

class AttendanceRepository {
  Future<List<Map<String, dynamic>>> fetchAttendance(String token, int studentId) async {
    final url = Uri.parse('http://127.0.0.1:5000/api/attendances/$studentId');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch attendance');
    }
  }
}
