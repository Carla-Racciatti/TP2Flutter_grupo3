import 'package:flutter/material.dart';
import '../screens/series_detail_screen.dart';

class SeriesCard extends StatelessWidget {
  final String imagePath;
  final int seriesIndex; // Agrega el índice de la serie

  // Asegúrate de pasar el índice de la serie al constructor
  SeriesCard({required this.imagePath, required this.seriesIndex});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          // Pasa el seriesIndex al detalle de la serie
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SeriesDetailScreen(seriesIndex: seriesIndex),
            ),
          );
        },
        child: Image.asset(imagePath), // Imagen de la serie recomendada
      ),
    );
  }
}
