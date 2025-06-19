import '../models/business.dart';
import 'data_loader_service.dart';

class BusinessService {
  final DataLoaderService _loader = DataLoaderService();

  Future<List<Business>> getBusinesses() async {
    final data = await _loader.loadJsonList('assets/data/businesses.json');
    return data.map((e) => Business.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<Business?> getBusinessById(int id) async {
    final businesses = await getBusinesses();
    try {
      return businesses.firstWhere((b) => b.id == id);
    } catch (_) {
      return null;
    }
  }
}
