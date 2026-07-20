
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
    if (!isFavorite) {
      return const Center(child: Text('لا يوجد عناصر في المفضلة بعد'));
    }

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: [
        _buildRestaurantCard(
          imagePath: 'images/restaurant.jpeg', // عدّل المسار حسب صورك
          name: 'مطعم الأصالة',
          description: 'مطعم شعبي يقدم أطباق مشوية طازجة ووجبات تقليدية بنكهة محلية أصيلة.',
          phone: '0991234567',
          hasDelivery: true,
          areaName: 'المنطقة الأولى',
          address: 'شارع الرئيسي',
          onRemoveFavorite: () {
            setState(() {
              isFavorite = false;
            });
          },
        ),
      ],
    );
  }

  Widget _buildRestaurantCard({
    required String imagePath,
    required String name,
    required String description,
    required String phone,
    required bool hasDelivery,
    required String areaName,
    required String address,
    VoidCallback? onTap,
    VoidCallback? onRemoveFavorite,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(14)),
                  child: Image.asset(
                    imagePath,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                PositionedDirectional(
                  top: 10,
                  start: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF235525),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.restaurant, size: 13, color: Colors.white),
                        const SizedBox(width: 4),
                        Text(
                          'مطاعم',
                          style: GoogleFonts.cairo(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                PositionedDirectional(
                  top: 6,
                  end: 6,
                  child: IconButton(
                    onPressed: onRemoveFavorite,
                    icon: const Icon(Icons.favorite, color: Colors.redAccent),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ),
                if (hasDelivery)
                  PositionedDirectional(
                    bottom: 8,
                    start: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.delivery_dining, size: 15, color: Color(0xFF235525)),
                          const SizedBox(width: 4),
                          Text(
                            'توصيل متاح',
                            style: GoogleFonts.cairo(fontSize: 11, color: const Color(0xFF235525)),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.cairo(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '$areaName - $address',
                          style: GoogleFonts.cairo(fontSize: 12.5, color: Colors.grey.shade700),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(fontSize: 13, color: Colors.black87),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.phone_outlined, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        phone,
                        style: GoogleFonts.cairo(fontSize: 12.5, color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}