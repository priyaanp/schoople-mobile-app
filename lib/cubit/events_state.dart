

import 'package:Schoople/models/event_model.dart';

abstract class EventsState {}

class EventsInitial extends EventsState {}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<EventModel> events;
  EventsLoaded(this.events);
}

class EventsError extends EventsState {
  final String message;
  EventsError(this.message);
}
