import 'package:flutter/material.dart';

import '../../models/business.dart';
import '../../models/deal.dart';
import '../../services/business_service.dart';
import '../../services/deals_service.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/loading_indicator.dart';
import 'deal_card.dart';

class DealsScreen extends StatelessWidget {
  DealsScreen({super.key});

  final DealService _dealService = DealService();
  final BusinessService _businessService = BusinessService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Deals'),
      body: FutureBuilder<List<dynamic>>( // will provide [deals, businesses]
        future: Future.wait([
          _dealService.getDeals(),
          _businessService.getBusinesses(),
        ]),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoadingIndicator();
          }
          final deals = snapshot.data![0] as List<Deal>;
          final businesses = snapshot.data![1] as List<Business>;
          return ListView.builder(
            itemCount: deals.length,
            itemBuilder: (context, index) {
              final deal = deals[index];
              final business =
                  businesses.firstWhere((b) => b.id == deal.businessId);
              return DealCard(deal: deal, business: business);
            },
          );
        },
      ),
    );
  }
}
