import 'package:alhoulaguide/services/auth_service.dart';
import 'package:alhoulaguide/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FavoritesService {
  static final _client = SupabaseService.client;

  // lib/services/favorites_service.dart

  static Future<void> addFavorite({
    required String itemType,
    required String itemId,
  }) async {
    final userId = AuthService.currentUser?.id;
    if (userId == null) return;

    // تحقق أولاً هل السجل موجود مسبقًا
    final existing = await _client
        .from('favorites')
        .select('id')
        .eq('user_id', userId)
        .eq('item_type', itemType)
        .eq('item_id', itemId)
        .maybeSingle();

    // إذا موجود أصلًا، لا داعي لإضافته مرة ثانية
    if (existing != null) return;

    await _client.from('favorites').insert({
      'user_id': userId,
      'item_type': itemType,
      'item_id': itemId,
    });
  }

  static Future<void> removeFavorite({
    required String itemType,
    required String itemId,
  }) async {
    final userId = AuthService.currentUser?.id;

    await _client
        .from('favorites')
        .delete()
        .eq('user_id', userId ?? '')
        .eq('item_type', itemType)
        .eq('item_id', itemId);
  }

  static Future<Set<String>> getFavoriteIds(String itemType) async {
    final userId = AuthService.currentUser?.id;
    if (userId == null) return {};

    final response = await _client
        .from('favorites')
        .select('item_id')
        .eq('user_id', userId)
        .eq('item_type', itemType);

    return (response as List).map((row) => row['item_id'] as String).toSet();
  }
}
