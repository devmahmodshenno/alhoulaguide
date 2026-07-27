import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class restaurantCard extends StatelessWidget {
  const restaurantCard({
    super.key,
    required this.restaurantName,
    required this.restaurantDescription,
    required this.restaurantPhone,
    required this.hasDelivery,
    required this.areaName,
    required this.address,
    required this.imagePath,
    required this.isFavorite,
    this.onTap,
    this.onRemoveFavorite,
  });
  final String restaurantName;
  final String restaurantDescription;
  final String restaurantPhone;
  final bool hasDelivery;
  final String areaName;
  final String address;
  final String imagePath;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onRemoveFavorite;

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14),
                  ),
                  child: Image.asset(
                    imagePath,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                PositionedDirectional(
                  top: 6,
                  end: 6,
                  child: IconButton(
                    onPressed: onRemoveFavorite,
                    icon: isFavorite ? const Icon(Icons.favorite, color: Colors.redAccent) : const Icon(Icons.favorite_border, color: Colors.grey),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.85),
                    ),
                  ),
                ),
                
                  PositionedDirectional(
                    bottom: 8,
                    start: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           Icon(
                            Icons.delivery_dining,
                            size: 15,
                            color: hasDelivery ? const Color(0xFF235525) : Colors.redAccent,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            hasDelivery ? 'توصيل متاح' : 'لا يوجد توصيل',
                            style: GoogleFonts.cairo(
                              fontSize: 11,
                              color: hasDelivery ? const Color(0xFF235525) : Colors.redAccent,
                            ),
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
                    restaurantName,
                    style: GoogleFonts.cairo(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '$areaName - $address',
                          style: GoogleFonts.cairo(
                            fontSize: 12.5,
                            color: Colors.grey.shade700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    restaurantDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_outlined,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        restaurantPhone,
                        style: GoogleFonts.cairo(
                          fontSize: 12.5,
                          color: Colors.grey.shade700,
                        ),
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
