import 'package:alhoulaguide/views/screen/restaurantsPage.dart';
import 'package:alhoulaguide/views/widget/sectionCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllSectionsPage extends StatelessWidget {
  const AllSectionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = [
      {
        'title': 'مطاعم',
        'icon': Icons.restaurant_outlined,
        'page': const RestaurantsPage(),
      },
      {
        'title': 'طوارئ',
        'icon': Icons.emergency_outlined,
        'page': null, // لسا ما جهزنا الصفحة الخاصة فيه
      },
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
                      // القسم لسا ما جهزنا صفحته
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
      ),
    );
  }
}
