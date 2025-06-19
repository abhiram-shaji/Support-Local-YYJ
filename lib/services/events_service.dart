import '../models/event.dart';
import 'data_loader_service.dart';

class EventService {
  final DataLoaderService _loader = DataLoaderService();

  Future<List<Event>> getEvents() async {
    final data = await _loader.loadJsonList('assets/data/events.json');
    return data.map((e) => Event.fromJson(e as Map<String, dynamic>)).toList();
  }
}
