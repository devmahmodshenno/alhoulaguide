import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBtmNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBtmNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromARGB(255, 35, 85, 37),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      selectedLabelStyle: GoogleFonts.cairo(
        color: const Color.fromARGB(255, 35, 85, 37),
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: GoogleFonts.cairo(
        color: Colors.grey,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'جميع الأقسام',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'المفضلة'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'المزيد'),
      ],
    );
  }
}
