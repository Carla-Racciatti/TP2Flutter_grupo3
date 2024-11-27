
import 'package:flutter/material.dart';

class ActorDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> actor;

  const ActorDetailsScreen({Key? key, required this.actor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final titleSize = screenWidth * 0.06;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          actor['name'],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del actor
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    actor['profileImage'],
                    height: screenWidth * 0.5,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: screenWidth * 0.5,
                        width: screenWidth * 0.5,
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: screenWidth * 0.2,
                          color: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Biografía
              Text(
                "Biografía",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                actor['biography'] ?? 'Biografía no disponible.',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: titleSize * 0.85),
              ),
              const SizedBox(height: 24),
              // Sección "Known For"
              if (actor['knownFor'] != null && actor['knownFor'].isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Known For",
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: screenWidth * 0.3,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: actor['knownFor'].length,
                        itemBuilder: (context, index) {
                          final knownForItem = actor['knownFor'][index];
                          return Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Container(
                              width: screenWidth * 0.4,
                              padding: const EdgeInsets.all(8),
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
            ],
          ),
        ),
      ),
    );
  }
}
