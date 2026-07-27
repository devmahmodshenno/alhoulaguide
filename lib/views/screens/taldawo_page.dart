import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaldawoPage extends StatelessWidget {
  const TaldawoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.white),
            Text('تلدو', style: GoogleFonts.cairo(fontSize: 20 , fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      body: const Center(child: Text('Welcome to Taldawo Page!')),
    );
  }
}
