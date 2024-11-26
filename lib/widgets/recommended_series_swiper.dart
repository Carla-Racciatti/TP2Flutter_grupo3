// lib/widgets/recommended_series_swiper.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/series_detail_screen.dart'; // Asegúrate de que esta pantalla exista

class RecommendedSeriesSwiper extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/series1.jpg',
    'assets/images/series2.jpg',
    'assets/images/series3.jpg',
    // Agrega más imágenes aquí
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Redirige al detalle de la serie al hacer clic
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeriesDetailScreen(seriesIndex: index),
                ),
              );
            },
            child: Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(imagePaths[index]),
            ),
          );
        },
      ),
    );
  }
}
