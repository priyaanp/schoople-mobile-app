import 'package:Schoople/cubit/events_cubit.dart';
import 'package:Schoople/cubit/events_state.dart';
import 'package:Schoople/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'event_list.dart';

class EventsPage extends StatefulWidget {
  EventsPage({required this.type});
  final int type;

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsCubit()..fetchEvents(context),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Events",
              style: GoogleFonts.inter(
                fontSize: 24,
                color: const Color(0xFF0278A9),
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Color(0xFF00A1B6),
            bottom: TabBar(
              tabs: [
                Tab(text: "Upcoming Events"),
                Tab(text: "Finished Events"),
              ],
            ),
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
              child: BlocBuilder<EventsCubit, EventsState>(
                builder: (context, state) {
                  if (state is EventsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is EventsError) {
                    return Center(child: Text(state.message));
                  } else if (state is EventsLoaded) {
                    List<EventModel> upcoming =
                        state.events.where((e) => e.color == "Green").toList();
                    List<EventModel> finished =
                        state.events.where((e) => e.color == "Red").toList();

                    return TabBarView(
                      children: [
                        EventList(events: upcoming),
                        EventList(events: finished),
                      ],
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
