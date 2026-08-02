// lib/views/screens/sections_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:alhoulaguide/views/widgets/section_card.dart';
import 'package:alhoulaguide/views/screens/restaurants_page.dart';

class SectionsPage extends StatelessWidget {
  final String? areaId;
  final String? areaName;

  const SectionsPage({super.key, this.areaId, this.areaName});

  @override
  Widget build(BuildContext context) {
    final sections = [
      {
        'title': 'مطاعم ومقاهي',
        'icon': Icons.restaurant_outlined,
        'page': RestaurantsPage(areaId: areaId, areaName: areaName),
      },
      {
        'title': 'طوارئ',
        'icon': Icons.emergency_outlined,
        'page': null,
      },
    ];

    final content = Column(
      children: [
        if (areaId == null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              "النتائج الظاهرة هي في كل منطقة الحولة مع إمكانية معرفة المنطقة التي ينتمي إليها كل قسم",
              style: GoogleFonts.cairo(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF235525),
              ),
            ),
          ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
            padding: const EdgeInsets.all(15),
            children: sections.map((section) {
              return SectionCard(
                title: section['title'] as String,
                icon: section['icon'] as IconData,
                onTap: () {
                  final page = section['page'] as Widget?;
                  if (page != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '${section['title']} — الصفحة قيد التجهيز',
                          style: GoogleFonts.cairo(),
                        ),
                      ),
                    );
                  }
                },
              );
            }).toList(),
          ),
        ),
      ],
    );

    // كتبويب (areaId == null): نرجع المحتوى فقط، بدون Scaffold/AppBar خاص
    if (areaId == null) {
      return Container(
        color: const Color(0xFFFFFAF0),
        child: content,
      );
    }

    // كصفحة منفصلة (areaId != null): نلف بـ Scaffold/AppBar خاص فيها
    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF0),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'أقسام $areaName',
          style: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 35, 85, 37),
      ),
      body: content,
    );
  }
}