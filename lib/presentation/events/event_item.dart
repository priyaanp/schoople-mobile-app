import 'package:Schoople/models/event_model.dart';
import 'package:flutter/material.dart';


class EventItem extends StatefulWidget {
  final EventModel event;

  EventItem({required this.event});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.event.color == "Green" ? Colors.green.shade100 : Colors.red.shade100,
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: ListTile(
        title: Text(widget.event.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(
          widget.event.description.length > 200
              ? "${widget.event.description.substring(0, 200)}..."
              : widget.event.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, color: widget.event.color == "Green" ? Colors.green : Colors.red),            
            Text(widget.event.formattedDateTime)
          ],
        ),
      ),
    );
  }
}
