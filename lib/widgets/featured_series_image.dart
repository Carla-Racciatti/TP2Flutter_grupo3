// lib/widgets/featured_series_image.dart
import 'package:flutter/material.dart';

class FeaturedSeriesImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Asegura que la imagen ocupe todo el ancho
      height: 300, // Ajusta la altura según sea necesario
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/series5.jpg'), // Ruta de la imagen destacada
          fit: BoxFit.cover, // Ajusta la imagen para que cubra todo el área disponible
        ),
      ),
    );
  }
}
