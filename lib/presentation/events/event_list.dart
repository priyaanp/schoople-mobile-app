import 'package:Schoople/models/event_model.dart';
import 'package:flutter/material.dart';

import 'event_item.dart';

class EventList extends StatelessWidget {
  final List<EventModel> events;
  
  EventList({required this.events});

  @override
  Widget build(BuildContext context) {
    if(events.isEmpty){
      return const Center(child: Text("No events available"));
    }
    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return EventItem(event: events[index]);
      },
    );
  }
}
