import 'package:flutter/material.dart';
import '../../widgets/series/featured_series_image.dart';
import '../../widgets/series/recommended_series_swiper.dart';
import '../../widgets/series/series_app_bar.dart';
import '../../widgets/series/series_search_delegate.dart';
import 'package:flutter_app/screens/series/series_detail_screen.dart';

class SeriesScreen extends StatelessWidget {
  final String featuredImagePath = 'assets/images/series/series5.jpg';
  final String featuredTitle = 'One Piece';
  final String featuredDescription = 'Luffy, un joven con poderes de goma, lidera a su tripulación en una épica aventura para encontrar el legendario tesoro "One Piece" y convertirse en el Rey de los Piratas, enfrentándose a enemigos poderosos y desafiando el orden mundial.';

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
                  builder: (context) => SeriesDetailScreen(
                    imagePath: featuredImagePath,
                    title: featuredTitle,
                    description: featuredDescription,
                  ),
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
