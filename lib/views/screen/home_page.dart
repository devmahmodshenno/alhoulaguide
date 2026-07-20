// lib/pages/home_page.dart
import 'package:alhoulaguide/views/screen/allSectionsPage.dart';
import 'package:alhoulaguide/views/screen/favoritesPage.dart';
import 'package:alhoulaguide/views/screen/homeContent.dart';
import 'package:alhoulaguide/views/screen/morePage.dart';
import 'package:alhoulaguide/views/widget/customBtmNavBar.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeContent(),
    Allsectionspage(),
    Favoritespage(),
    MorePage(),
  ];

  final List<String> _titles = const [
    'الرئيسية',
    'جميع الأقسام',
    'المفضلة',
    'المزيد',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF0),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 35, 85, 37),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBtmNavBar(
        selectedIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}