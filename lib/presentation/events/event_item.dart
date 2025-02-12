import 'package:Schoople/models/event_model.dart';
import 'package:flutter/material.dart';


class EventItem extends StatelessWidget {
  final EventModel event;

  EventItem({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: event.color == "Green" ? Colors.green.shade100 : Colors.red.shade100,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(event.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(
          event.description.length > 200
              ? "${event.description.substring(0, 200)}..."
              : event.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, color: event.color == "Green" ? Colors.green : Colors.red),            
            Text(event.formattedDateTime)
          ],
        ),
      ),
    );
  }
}
