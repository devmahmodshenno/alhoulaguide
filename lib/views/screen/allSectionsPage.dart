// lib/pages/all_sections_page.dart
import 'package:alhoulaguide/views/widget/sectionCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllSectionsPage extends StatelessWidget {
  const AllSectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      {'title': 'أماكن سياحية', 'icon': Icons.landscape_outlined},
      {'title': 'مطاعم ومقاهي', 'icon': Icons.restaurant_outlined},
      {'title': 'فنادق', 'icon': Icons.hotel_outlined},
      {'title': 'خدمات', 'icon': Icons.support_agent_outlined},
      {'title': 'مستشفيات وصيدليات', 'icon': Icons.local_hospital_outlined},
      {'title': 'تسوق', 'icon': Icons.shopping_bag_outlined},
      {'title': 'نقل ومواصلات', 'icon': Icons.directions_bus_outlined},
      {'title': 'طوارئ', 'icon': Icons.emergency_outlined},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFFAF0),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text(
              "النتائج الظاهرة هي في كل منطقة الحولة مع إمكانية معرفة المنطقة التي ينتمي إليها كل قسم",
              style: GoogleFonts.cairo(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF235525),
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
                    // لاحقًا: الانتقال لصفحة تفاصيل القسم
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
