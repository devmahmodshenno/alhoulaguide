import 'package:alhoulaguide/models/restaurant_model.dart';
import 'package:alhoulaguide/services/favorites_service.dart';
import 'package:alhoulaguide/services/restaurant_service.dart';
import 'package:alhoulaguide/views/widgets/restaurant_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  late Future<List<RestaurantModel>> _restaurantsFuture;
  Set<String> _favoritesId = {};

  @override
  void initState() {
    super.initState();
    _restaurantsFuture = _loadData();
  }

  Future<List<RestaurantModel>> _loadData() async {
    final results = await Future.wait([
      RestaurantService.getAllRestaurants(),
      FavoritesService.getFavoriteIds('restaurant'),
    ]);

    _favoritesId = results[1] as Set<String>;
    return results[0] as List<RestaurantModel>;
  }

  Future<void> _toggleFavorite(String restaurantId) async {
    final isCurrentlyFavorite = _favoritesId.contains(restaurantId);

    setState(() {
      if (isCurrentlyFavorite) {
        _favoritesId.remove(restaurantId);
      } else {
        _favoritesId.add(restaurantId);
      }
    });

    if (isCurrentlyFavorite) {
      await FavoritesService.removeFavorite(
        itemType: 'restaurant',
        itemId: restaurantId,
      );
    } else {
      await FavoritesService.addFavorite(
        itemType: 'restaurant',
        itemId: restaurantId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF0),
      appBar: AppBar(
        title: Text(
          'مطاعم',
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 35, 85, 37),
        iconTheme: IconThemeData(
          color: const Color.fromARGB(255, 244, 231, 54),
        ),
      ),
      body: FutureBuilder(
        future: _restaurantsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "حدث خطأ أثناء تحميل البيانات",
                style: GoogleFonts.cairo(fontSize: 15, color: Colors.red),
              ),
            );
          }
          final restaurants = snapshot.data ?? [];
          if (restaurants.isEmpty) {
            return Center(
              child: Text(
                "لا توجد مطاعم مضافة بعد",
                style: GoogleFonts.cairo(fontSize: 15),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return RestaurantCard(
                restaurantName: restaurant.restaurantName,
                restaurantDescription: restaurant.restaurantDescription ?? '',
                restaurantPhone: restaurant.restaurantPhone,
                hasDelivery: restaurant.restaurantHasDelivery,
                areaName: restaurant.areaName ?? '',
                address: restaurant.restaurantAddress ?? '',
                imagePath:
                    restaurant.restaurantImageUrl ?? '',
                isFavorite: _favoritesId.contains(restaurant.restaurantId),
                onRemoveFavorite: () => _toggleFavorite(restaurant.restaurantId),
              );
            },
          );
        },
      ),
    );
  }
}
