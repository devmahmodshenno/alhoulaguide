import 'package:alhoulaguide/views/screens/favorites_page.dart';
import 'package:alhoulaguide/views/screens/home_content.dart';
import 'package:alhoulaguide/views/screens/more_page.dart';
import 'package:alhoulaguide/views/screens/sections_page.dart';
import 'package:alhoulaguide/views/widgets/custom_btm_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final GlobalKey<FavoritesPageState> _favoritesKey =
      GlobalKey<FavoritesPageState>();

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeContent(),
      const SectionsPage(),
      FavoritesPage(key: _favoritesKey), // ✅ الربط الصحيح
      const MorePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 2) {
      _favoritesKey.currentState?.refresh();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'دليل الحولة',
          textAlign: TextAlign.start,
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 35, 85, 37),
      ),
      backgroundColor: const Color(0xFFFFFAF0),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: CustomBtmNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
