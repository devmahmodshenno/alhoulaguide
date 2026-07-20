import 'package:flutter/material.dart';

class AreaCard extends StatelessWidget {
  final String areaName;
  final VoidCallback? onTap;

  const AreaCard({super.key, required this.areaName, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEAF3E9),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF235525), width: 1),
        ),
        child: Center(
          child: Text(
            areaName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF235525),
            ),
          ),
        ),
      ),
    );
  }
}
