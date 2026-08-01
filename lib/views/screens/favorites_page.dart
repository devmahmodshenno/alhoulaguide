// lib/views/screens/favorites_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alhoulaguide/services/restaurant_service.dart';
import 'package:alhoulaguide/services/favorites_service.dart';
import 'package:alhoulaguide/models/restaurant_model.dart';
import 'package:alhoulaguide/views/widgets/restaurant_card.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => FavoritesPageState();
}

// لاحظ: الاسم بدون Underscore (_) في البداية، حتى يصير قابل للوصول من HomePage
class FavoritesPageState extends State<FavoritesPage> {
  late Future<List<RestaurantModel>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _favoritesFuture = _loadFavoriteRestaurants();
  }

  Future<List<RestaurantModel>> _loadFavoriteRestaurants() async {
    final favoriteIds = await FavoritesService.getFavoriteIds('restaurant');
    final restaurants = await RestaurantService.getRestaurantsByIds(
      favoriteIds.toList(),
    );
    return restaurants;
  }

  /// دالة عامة تُستدعى من الخارج (HomePage) لإعادة تحميل البيانات
  void refresh() {
    setState(() {
      _favoritesFuture = _loadFavoriteRestaurants();
    });
  }

  Future<void> _removeFromFavorites(String restaurantId) async {
    await FavoritesService.removeFavorite(
      itemType: 'restaurant',
      itemId: restaurantId,
    );
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RestaurantModel>>(
      future: _favoritesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(
              'حدث خطأ أثناء تحميل المفضلة',
              style: GoogleFonts.cairo(fontSize: 15, color: Colors.red),
            ),
          );
        }

        final favorites = snapshot.data ?? [];

        if (favorites.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 60,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 12),
                Text(
                  'لا يوجد عناصر في المفضلة بعد',
                  style: GoogleFonts.cairo(
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final restaurant = favorites[index];
            return RestaurantCard(
              imagePath: restaurant.restaurantImageUrl ?? '',
              restaurantName: restaurant.restaurantName,
              restaurantDescription: restaurant.restaurantDescription ?? '',
              restaurantPhone: restaurant.restaurantPhone ?? '',
              hasDelivery: restaurant.restaurantHasDelivery,
              areaName: restaurant.areaName ?? '',
              address: restaurant.restaurantAddress ?? '',
              isFavorite: true,
              onRemoveFavorite: () =>
                  _removeFromFavorites(restaurant.restaurantId),
            );
          },
        );
      },
    );
  }
}
