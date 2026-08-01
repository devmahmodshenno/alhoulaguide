import 'supabase_service.dart';
import '../models/restaurant_model.dart';

class RestaurantService {
  static final _client = SupabaseService.client;

  /// يجيب كل المطاعم مع اسم المنطقة لكل واحد (JOIN)
  static Future<List<RestaurantModel>> getAllRestaurants() async {
    final response = await _client
        .from('restaurants')
        .select('*, areas(name_area)');

    return (response as List)
        .map((row) => RestaurantModel.fromJson(row))
        .toList();
  }

  /// يجيب مطاعم منطقة معينة فقط
  static Future<List<RestaurantModel>> getRestaurantsByArea(
    String areaId,
  ) async {
    final response = await _client
        .from('restaurants')
        .select('*, areas(name_area)')
        .eq('restaurant_area_id', areaId);

    return (response as List)
        .map((row) => RestaurantModel.fromJson(row))
        .toList();
  }

  /// يجيب مطاعم محددة بمعرّفاتها (يُستخدم لصفحة المفضلة)
  static Future<List<RestaurantModel>> getRestaurantsByIds(
    List<String> restaurantIds,
  ) async {
    if (restaurantIds.isEmpty) return [];
  
    final response = await _client
        .from('restaurants')
        .select('*, areas(name_area)')
        .inFilter('restaurant_id', restaurantIds);

    return (response as List)
        .map((row) => RestaurantModel.fromJson(row))
        .toList();
  }
}
