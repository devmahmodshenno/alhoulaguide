import 'supabase_service.dart';
import '../models/area_model.dart';

class AreaService {
  static final _client = SupabaseService.client;

  static Future<List<AreaModel>> getAllAreas() async {
    final response = await _client.from('areas').select();

    return (response as List)
        .map((row) => AreaModel.fromJson(row))
        .toList();
  }
}