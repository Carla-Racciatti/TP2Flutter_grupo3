import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  final Map<String, dynamic> actor;
  final VoidCallback onTap;

  const ActorCard({
    Key? key,
    required this.actor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = constraints.maxWidth;
        final titleSize = cardWidth * 0.06;

        return Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen con FadeIn
                Expanded(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.png', // Imagen de carga
                    image: actor['profileImage'],
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: cardWidth * 0.3,
                          color: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
                // Detalles del actor
                Padding(
                  padding: EdgeInsets.all(cardWidth * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Nombre del actor
                      Text(
                        actor['name'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: cardWidth * 0.02),
                      // Popularidad
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: titleSize),
                          SizedBox(width: cardWidth * 0.02),
                          Text(
                            'Popularity: ${actor['popularity'].toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: titleSize * 0.8,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: cardWidth * 0.04),
                      // Biografía
                      Text(
                        actor['biography'] ?? 'Biography not available.',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: titleSize * 0.85,
                          color: Colors.grey[800],
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                // Sección knownFor
                if (actor['knownFor'] != null && actor['knownFor'].isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: cardWidth * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Known For',
                          style: TextStyle(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: cardWidth * 0.3,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: actor['knownFor'].length,
                            itemBuilder: (context, index) {
                              final knownForItem = actor['knownFor'][index];
                              return Padding(
                                padding: EdgeInsets.only(right: cardWidth * 0.03),
                                child: Container(
                                  width: cardWidth * 0.4,
                                  padding: EdgeInsets.all(cardWidth * 0.02),
                                  decoration: BoxDecoration(
                                    color: Colors.blue[50],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      knownForItem,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: titleSize * 0.8,
                                        color: Colors.grey[800],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
