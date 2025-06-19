import 'package:flutter/material.dart';

import '../../models/business.dart';
import '../../widgets/app_bar.dart';

class BusinessDetailScreen extends StatelessWidget {
  final Business business;
  const BusinessDetailScreen({required this.business, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(business.name),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(business.description,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Text('Hours: ${business.hours}'),
            const SizedBox(height: 4),
            Text('Contact: ${business.contact}'),
            const SizedBox(height: 4),
            InkWell(
              onTap: () {},
              child: Text(business.website,
                  style: const TextStyle(color: Colors.blue)),
            ),
            const SizedBox(height: 4),
            InkWell(
              onTap: () {},
              child: const Text('View on Map', style: TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
