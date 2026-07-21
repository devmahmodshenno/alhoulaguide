import 'package:alhoulaguide/views/widget/restaurantCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
   

    return const Center(
      child: Text(
        "قريبا سيتم إضافة المفضلة",
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
