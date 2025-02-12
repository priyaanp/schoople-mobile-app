import 'package:Schoople/domain/core/api_end_ponts.dart';
import 'package:Schoople/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'events_state.dart';

import '../cubit/app_state_cubit.dart';

class EventsCubit extends Cubit<EventsState> {
  EventsCubit() : super(EventsInitial());

  Future<void> fetchEvents(BuildContext context) async {
    emit(EventsLoading());

    try {
      final String token = context.read<AppStateCubit>().state.token ?? "";
      final int schoolId = context.read<AppStateCubit>().state.schoolId ?? 0;
      final response = await http.get(
        Uri.parse("${ApiEndPoints.baseUrl}/api/events/$schoolId"),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode == 200) {
        List jsonData = jsonDecode(response.body);
        List<EventModel> events = jsonData.map((e) => EventModel.fromJson(e)).toList();
        emit(EventsLoaded(events));
      } else {
        emit(EventsError("Failed to fetch events."));
      }
    } catch (e) {
      emit(EventsError("An error occurred: $e"));
    }
  }
}
