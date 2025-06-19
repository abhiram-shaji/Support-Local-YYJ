import 'package:flutter/material.dart';
import '../../models/event.dart';

class EventCard extends StatelessWidget {
  final Event event;
  const EventCard({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    final imagePath = event.image ?? 'assets/img/default.png';
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.black.withOpacity(0.9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(event.title,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white)),
                  const SizedBox(height: 8),
                  Text(event.location,
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(
                    'Date: ${event.date.toLocal().toString().split(' ')[0]}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.description,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
