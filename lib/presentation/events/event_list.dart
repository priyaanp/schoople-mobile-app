import 'package:Schoople/models/event_model.dart';
import 'package:flutter/material.dart';

import 'event_item.dart';

class EventList extends StatefulWidget {
  final List<EventModel> events;
  
  EventList({required this.events});

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  @override
  Widget build(BuildContext context) {
    if(widget.events.isEmpty){
      return const Center(child: Text("No events available"));
    }
    return ListView.builder(
      itemCount: widget.events.length,
      itemBuilder: (context, index) {
        return EventItem(event: widget.events[index]);
      },
    );
  }
}
