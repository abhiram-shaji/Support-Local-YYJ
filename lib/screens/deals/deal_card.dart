import 'package:flutter/material.dart';
import '../../models/deal.dart';
import '../../models/business.dart';

class DealCard extends StatelessWidget {
  final Deal deal;
  final Business business;
  const DealCard({required this.deal, required this.business, super.key});

  @override
  Widget build(BuildContext context) {
    final imagePath = deal.image ?? 'assets/img/default.png';
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
                  Text(business.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.white)),
                  const SizedBox(height: 8),
                  Text(deal.discountText,
                      style: const TextStyle(color: Colors.white)),
                  const SizedBox(height: 4),
                  Text(
                    'Expires: ${deal.expiry.toLocal().toString().split(' ')[0]}',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
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
