import 'dart:async';
import 'package:alhoulaguide/views/widget/areaCard.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> ads = [
    'images/ads.jpeg',
    'images/ads.jpeg',
    'images/ads.jpeg',
    'images/ads.jpeg',
    'images/ads.jpeg',
  ];

  late final PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted) return;

      _currentPage++;
      if (_currentPage >= ads.length) {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF0),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'دليل الحولة',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 35, 85, 37),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            '  آخر العروض و الإعلانات',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: ads.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(ads[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              ads.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 20 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? const Color.fromARGB(255, 35, 85, 37)
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),

          const Align(
            alignment: AlignmentGeometry.centerEnd,
            child: Text(
              "المزيد...  ",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            "  تصفح حسب المنطقة",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.15,
              padding: const EdgeInsets.all(15),
              children: [
                AreaCard(areaName: 'المنطقة الأولى', onTap: () {}),
                AreaCard(areaName: 'المنطقة الثانية', onTap: () {}),
                AreaCard(areaName: 'المنطقة الثالثة', onTap: () {}),
                AreaCard(areaName: 'المنطقة الرابعة', onTap: () {}),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 35, 85, 37),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        selectedLabelStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
      ),
    );
  }
}
