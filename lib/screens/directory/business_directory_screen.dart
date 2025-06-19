import 'package:flutter/material.dart';

import '../../models/business.dart';
import '../../services/business_service.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/loading_indicator.dart';
import 'business_tile.dart';
import '../business_detail/business_detail_screen.dart';

class BusinessDirectoryScreen extends StatefulWidget {
  const BusinessDirectoryScreen({super.key});

  @override
  State<BusinessDirectoryScreen> createState() => _BusinessDirectoryScreenState();
}

class _BusinessDirectoryScreenState extends State<BusinessDirectoryScreen> {
  final BusinessService _businessService = BusinessService();
  String _search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Businesses'),
      body: FutureBuilder<List<Business>>(
        future: _businessService.getBusinesses(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoadingIndicator();
          }
          final businesses = snapshot.data!
              .where((b) => b.name.toLowerCase().contains(_search.toLowerCase()))
              .toList();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) => setState(() => _search = value),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: businesses.length,
                  itemBuilder: (context, index) {
                    final business = businesses[index];
                    return BusinessTile(
                      business: business,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BusinessDetailScreen(business: business)),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
