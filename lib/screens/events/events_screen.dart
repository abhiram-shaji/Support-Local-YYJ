import 'package:flutter/material.dart';

import '../../models/event.dart';
import '../../services/events_service.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/loading_indicator.dart';
import 'event_card.dart';

class EventsScreen extends StatelessWidget {
  EventsScreen({super.key});

  final EventService _eventService = EventService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Events'),
      body: FutureBuilder<List<Event>>(
        future: _eventService.getEvents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoadingIndicator();
          }
          final events = snapshot.data!;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return EventCard(event: event);
            },
          );
        },
      ),
    );
  }
}
