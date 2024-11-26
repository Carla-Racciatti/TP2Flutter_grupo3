import 'package:flutter/material.dart';
import '../widgets/featured_series_image.dart';
import '../widgets/recommended_series_swiper.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/series_app_bar.dart';
import '../widgets/series_search_delegate.dart';
import 'package:flutter_app/screens/series_detail_screen.dart'; // Asegúrate de importar el detalle de la serie

class SeriesScreen extends StatelessWidget {
  void _onSearchTap(BuildContext context) {
    showSearch(
      context: context,
      delegate: SeriesSearchDelegate(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SeriesAppBar(
        title: 'Series',
        onSearchTap: () => _onSearchTap(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SeriesDetailScreen(seriesIndex: 0), // Pasas el índice de la serie
                ),
              );
            },
            child: FeaturedSeriesImage(), // Imagen principal clickeable
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Series Recomendadas",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          RecommendedSeriesSwiper(),
        ],
      ),
    );
  }
}
