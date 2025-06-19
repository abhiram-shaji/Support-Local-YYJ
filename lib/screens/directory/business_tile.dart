import 'package:flutter/material.dart';
import '../../models/business.dart';

class BusinessTile extends StatelessWidget {
  final Business business;
  final VoidCallback onTap;
  const BusinessTile({required this.business, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(business.name),
      subtitle: Text(business.description),
      onTap: onTap,
      trailing: Wrap(
        spacing: 4,
        children: business.tags
            .map((tag) => Chip(label: Text(tag), visualDensity: VisualDensity.compact))
            .toList(),
      ),
    );
  }
}
