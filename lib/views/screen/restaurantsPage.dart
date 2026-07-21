// lib/views/screen/restaurantsPage.dart
import 'package:alhoulaguide/views/widget/restaurantCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 // عدّل المسار حسب مكان الملف عندك

class RestaurantsPage extends StatelessWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF0),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'مطاعم',
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 35, 85, 37),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          restaurantCard(
            restaurantName: 'مطعم الحولة',
            imagePath: 'images/restaurant.jpeg',
            restaurantDescription: 'مطعم يقدم أطباق متنوعة من المأكولات المحلية والعالمية.',
            restaurantPhone: '0991234567',
            hasDelivery: true,
            isFavorite: true,
            areaName:'تلذهب',
            address: 'شارع السوق',
            onRemoveFavorite: () {
              
            },
            
          ),
          restaurantCard(
            restaurantName: ' مطعم الطيبة',
            imagePath: 'images/restaurant.jpeg',
            restaurantDescription: 'مطعم يقدم أطباق متنوعة من المأكولات المحلية والعالمية.',
            restaurantPhone: '0997654321',
            hasDelivery: false,
            isFavorite: false,
            areaName:'تلدو',
            address: 'شارع النخيل',
            onRemoveFavorite: () {
              
            },
          ),
        ],
      ),
    );
  }
}