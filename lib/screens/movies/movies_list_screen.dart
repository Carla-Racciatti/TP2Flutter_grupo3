import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import '../../widgets/movies/movie_card.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  final _movies = [
    {
      'id': '1',
      'title': 'El Señor de los Anillos',
      'releaseDate': '2001',
      'rating': 4.8,
      'genres': ['Fantasía', 'Aventura'],
      'imageAsset': 'assets/images/movies/lotr.jpg',
      'synopsis': 'Un hobbit de la Comarca y ocho compañeros emprenden un viaje para destruir el poderoso Anillo Único y salvar la Tierra Media del Señor Oscuro Sauron.'
    },
    {
      'id': '2',
      'title': 'Inception',
      'releaseDate': '2010',
      'rating': 4.5,
      'genres': ['Ciencia Ficción', 'Acción'],
      'imageAsset': 'assets/images/movies/inception.jpg',
      'synopsis': 'Un ladrón con la rara habilidad de robar secretos de las mentes de las personas mientras sueñan recibe la tarea inversa de plantar una idea en la mente de un CEO.'
    },
    {
      'id': '3',
      'title': 'El Padrino',
      'releaseDate': '1972',
      'rating': 4.9,
      'genres': ['Drama', 'Crimen'],
      'imageAsset': 'assets/images/movies/godfather.jpg',
      'synopsis': 'El patriarca de una dinastía del crimen organizado transfiere el control de su imperio clandestino a su reacio hijo.'
    },
    {
      'id': '4',
      'title': 'Pulp Fiction',
      'releaseDate': '1994',
      'rating': 4.7,
      'genres': ['Crimen', 'Drama'],
      'imageAsset': 'assets/images/movies/pulp_fiction.jpg',
      'synopsis': 'Las vidas de dos sicarios, un boxeador, la esposa de un gángster y dos bandidos se entrelazan en cuatro historias de violencia y redención.'
    },
    {
      'id': '5',
      'title': 'The Matrix',
      'releaseDate': '1999',
      'rating': 4.6,
      'genres': ['Ciencia Ficción', 'Acción'],
      'imageAsset': 'assets/images/movies/matrix.jpg',
      'synopsis': 'Un programador de computadoras descubre que la realidad es una simulación y se une a una rebelión para derrocar a las máquinas que controlan todo.'
    },
    {
      'id': '6',
      'title': 'Forrest Gump',
      'releaseDate': '1994',
      'rating': 4.8,
      'genres': ['Drama', 'Romance'],
      'imageAsset': 'assets/images/movies/forrest_gump.jpg',
      'synopsis': 'Las décadas en la vida de un hombre con discapacidades intelectuales mientras es testigo y, sin saberlo, influye en varios momentos históricos definitorios del siglo XX.'
    },
    {
      'id': '7',
      'title': 'El Club de la Pelea',
      'releaseDate': '1999',
      'rating': 4.7,
      'genres': ['Drama', 'Suspenso'],
      'imageAsset': 'assets/images/movies/fight_club.jpg',
      'synopsis': 'Un empleado de oficina insomne y un fabricante de jabón carismático forman un club de lucha clandestino que evoluciona en algo mucho más peligroso.'
    },
    {
      'id': '8',
      'title': 'La Lista de Schindler',
      'releaseDate': '1993',
      'rating': 4.9,
      'genres': ['Drama', 'Historia'],
      'imageAsset': 'assets/images/movies/schindler.jpg',
      'synopsis': 'En la Polonia ocupada por los alemanes durante la Segunda Guerra Mundial, el industrial Oskar Schindler se preocupa por sus trabajadores judíos después de presenciar su persecución.'
    },
    {
      'id': '9',
      'title': 'El Lobo de Wall Street',
      'releaseDate': '2013',
      'rating': 4.4,
      'genres': ['Drama', 'Biografía', 'Comedia'],
      'imageAsset': 'assets/images/movies/wolf.jpg',
      'synopsis': 'La historia verdadera de Jordan Belfort, desde su ascenso como corredor de bolsa hasta su caída por corrupción y fraude.'
    },
    {
      'id': '10',
      'title': 'Parásitos',
      'releaseDate': '2019',
      'rating': 4.8,
      'genres': ['Drama', 'Suspenso'],
      'imageAsset': 'assets/images/movies/parasite.jpg',
      'synopsis': 'Una familia pobre se infiltra en la vida de una familia rica, con consecuencias inesperadas.'
    },
    {
      'id': '11',
      'title': 'Avatar',
      'releaseDate': '2009',
      'rating': 4.5,
      'genres': ['Ciencia Ficción', 'Aventura'],
      'imageAsset': 'assets/images/movies/avatar.jpg',
      'synopsis': 'Un marine parapléjico enviado a la luna Pandora se debate entre seguir órdenes y proteger el mundo que siente como su hogar.'
    },
    {
      'id': '12',
      'title': 'Avengers: Endgame',
      'releaseDate': '2019',
      'rating': 4.7,
      'genres': ['Acción', 'Aventura', 'Ciencia Ficción'],
      'imageAsset': 'assets/images/movies/endgame.jpg',
      'synopsis': 'Los Vengadores que sobrevivieron intentan revertir los efectos de Thanos y restaurar el universo.'
    }
  ];

  String _searchQuery = '';
  String? _selectedGenre;

  List<String> _getAllGenres() {
    Set<String> genres = {};
    for (var movie in _movies) {
      genres.addAll((movie['genres'] as List<String>));
    }
    return genres.toList()..sort();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var filteredMovies = _movies.where((movie) {
      final titleMatches = movie['title'].toString().toLowerCase()
          .contains(_searchQuery.toLowerCase());
      final genreMatches = _selectedGenre == null || 
          (movie['genres'] as List<String>).contains(_selectedGenre);
      return titleMatches && genreMatches;
    }).toList();

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: const CustomAppBar(title: 'Películas'),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            decoration: BoxDecoration(
              color: theme.cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar películas',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      prefixIcon: Icon(Icons.search, color: theme.primaryColor),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                    ),
                    onChanged: (value) => setState(() => _searchQuery = value),
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  children: [
                    _buildFilterChip('Todos', null),
                    ..._getAllGenres().map((genre) => _buildFilterChip(genre, genre)),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount;
                if (constraints.maxWidth < 450) {
                  crossAxisCount = 1;
                } else if (constraints.maxWidth < 800) {
                  crossAxisCount = 2;
                } else if (constraints.maxWidth < 1100) {
                  crossAxisCount = 3;
                } else {
                  crossAxisCount = 4;
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: filteredMovies.length,
                  itemBuilder: (context, index) {
                    final movie = filteredMovies[index];
                    return MovieCard(
                      movie: movie,
                      onTap: () => Navigator.pushNamed(
                        context,
                        'movie_details',
                        arguments: movie,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String? genre) {
    final isSelected = _selectedGenre == genre;
    final theme = Theme.of(context);
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: FilterChip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : theme.textTheme.bodyLarge?.color,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        onSelected: (_) => setState(() => _selectedGenre = genre),
        backgroundColor: theme.colorScheme.surface,
        selectedColor: theme.primaryColor,
        elevation: isSelected ? 4 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.transparent : theme.dividerColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}