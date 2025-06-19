import '../models/deal.dart';
import 'data_loader_service.dart';

class DealService {
  final DataLoaderService _loader = DataLoaderService();

  Future<List<Deal>> getDeals() async {
    final data = await _loader.loadJsonList('assets/data/deals.json');
    return data.map((e) => Deal.fromJson(e as Map<String, dynamic>)).toList();
  }
}
