
import 'package:Schoople/presentation/attendance/attendance_calendar_page.dart';
import 'package:Schoople/presentation/events/events_page.dart';
import 'package:Schoople/presentation/exam_mark/exam_mark_details_page.dart';
import 'package:Schoople/presentation/exam_schedule/exam_schedule_page.dart';
import 'package:Schoople/presentation/profile/screen_profile.dart';
import 'package:Schoople/presentation/timetable/timetable_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final List<Map<String, String>> dashboardItems = [
    {'title': 'Time Table', 'icon': 'assets/images/time_table.png'},
    {'title': 'Attendance', 'icon': 'assets/images/attendance.png'},
    {'title': 'Reports', 'icon': 'assets/images/reports.png'},
    {'title': 'Fees', 'icon': 'assets/images/fees.png'},
    {'title': 'Exam schedule', 'icon': 'assets/images/exam_schedule.png'},
    {'title': 'Assignment', 'icon': 'assets/images/assignment.png'},
    {'title': 'Events', 'icon': 'assets/images/events.png'},
    {'title': 'CCA', 'icon': 'assets/images/cca.png'},
    {'title': 'Library', 'icon': 'assets/images/library.png'},
    {'title': 'Notification', 'icon': 'assets/images/notification.png'},
    {'title': 'Messages', 'icon': 'assets/images/messages.png'},
    {'title': 'Circular', 'icon': 'assets/images/circular.png'},
    {'title': 'Transportation', 'icon': 'assets/images/transportation.png'},
    {'title': 'You', 'icon': 'assets/images/profile.png'},
    {'title': 'My Teacher', 'icon': 'assets/images/my_teacher.png'},
    {'title': 'Principal', 'icon': 'assets/images/principal.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Dashboard',
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
              begin: Alignment.topCenter, // Approximate for 242 degrees
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF00A1B6), // Start color
                Color(0xFF0276A8), // End color
              ],
              stops: [0.1113, 1.0], // Corresponding stops
            ),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemCount: dashboardItems.length,
              itemBuilder: (context, index) {
                return DashboardItem(
                  title: dashboardItems[index]['title']!,
                  iconPath: dashboardItems[index]['icon']!,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardItem extends StatefulWidget {
  final String title;
  final String iconPath;

  const DashboardItem({
    super.key,
    required this.title,
    required this.iconPath,
  });

  @override
  State<DashboardItem> createState() => _DashboardItemState();
}

class _DashboardItemState extends State<DashboardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: const Color(0xE8EBED),
      child: InkWell(
        onTap: () {
          // Handle item tap
          print('Tapped on ${widget.title}');
          _goToPage(widget.title,context);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.iconPath,
              width: 50,
              height: 50,
            ),
            //  const SizedBox(height: 10),
            Text(
              widget.title,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: const Color(0xFF494949),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _goToPage(String title, BuildContext ctx) {

   Widget page;

   // You can also use if else here.
   switch(title) {
     case 'You':
       page = StudentProfilePage(type: 1);
     break;
     case 'Time Table':
       page = TimetablePage(type: 1,);
     break;
     case 'Attendance':
       page = AttendanceCalendarPage(type: 1);
     break;     
     case 'Events':
       page = EventsPage(type: 1);
     break; 
    case 'Exam schedule':
       page = ExamSchedulePage(type:1);
     break;   
    case 'Reports':
       page = ExamMarksPage();
     break;      
     
     default:
       page = StudentProfilePage(type: 1); // default item when no matching category found
   }

   Navigator.push(ctx, MaterialPageRoute(builder: (context) {
        return page; 
      }));
}
}

