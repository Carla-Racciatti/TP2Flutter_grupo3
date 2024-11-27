import 'package:flutter/material.dart';

class FeaturedSeriesImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/series/series5.jpg'), // Ruta de la imagen destacada
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
