import 'package:flutter/material.dart';
import '../../models/deal.dart';
import '../../models/business.dart';

class DealCard extends StatelessWidget {
  final Deal deal;
  final Business business;
  const DealCard({required this.deal, required this.business, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(business.name, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(deal.discountText),
            const SizedBox(height: 4),
            Text('Expires: ${deal.expiry.toLocal().toString().split(' ')[0]}',
                style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
