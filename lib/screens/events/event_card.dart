import 'package:flutter/material.dart';
import '../../models/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(event.location),
            const SizedBox(height: 4),
            Text('Date: ${event.date.toLocal().toString().split(' ')[0]}'),
            const SizedBox(height: 4),
            Text(event.description),
          ],
        ),
      ),
    );
  }
}
