
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import '../../mocks/actors_mock.dart';
import 'actor_details_screen.dart';
import '../../widgets/actors_widgets/custom_list_tile.dart';


class ActorsListScreen extends StatefulWidget {
  @override
  _ActorsListScreenState createState() => _ActorsListScreenState();
}

class _ActorsListScreenState extends State<ActorsListScreen> {
  List<dynamic> actors = [];
  int currentIndex = 0;
  final int pageSize = 10;
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  bool hasMoreActors = true;

  @override
  void initState() {
    super.initState();
    _loadMoreActors();
  }

  void _loadMoreActors() {
    setState(() {
      List<dynamic> filteredActors = actorsMocks
          .where((actor) =>
              actor['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
              actor['id'].toString().contains(searchQuery))
          .toList();

      actors = filteredActors.sublist(0, (currentIndex + pageSize) > filteredActors.length
          ? filteredActors.length
          : currentIndex + pageSize);

      // Verificar si hemos cargado todos los actores
      hasMoreActors = actors.length < filteredActors.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Actores Populares',
      ),
      body: Column(
        children: [
          SizedBox(height: 8),  // Espacio después del AppBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0 , vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Escribe nombre o ID del actor para buscar",
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  currentIndex = 0; // Reinicia la búsqueda
                  _loadMoreActors();
                });
              },
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  if (actors.length < actorsMocks.length && hasMoreActors) {
                    currentIndex += 5;
                    _loadMoreActors();
                  }
                }
                return false;
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),  // Efecto de rebote al llegar al final
                itemCount: actors.isEmpty
                    ? 1  // Muestra el mensaje de "No coincidencias" si no hay actores
                    : actors.length + (hasMoreActors ? 0 : 1), // Añadimos un solo item al final si no hay más actores
                itemBuilder: (context, index) {
                  if (actors.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('No coincidences')),
                    );
                  }

                  // Si no hay más actores para cargar, mostramos el mensaje que avisa que es el fin de la lista
                  if (!hasMoreActors && index == actors.length) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(' - Fin de la lista - ')),
                    );
                  }

                  return Column(
                    children: [
                      CustomListTile(
                        actor: actors[index],
                        onTap: () {
                          // Navegar a la pantalla de detalles del actor
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ActorDetailsScreen(actor: actors[index]),
                            ),
                          );
                        },
                      ),
                      Divider(
                        color: const Color.fromARGB(255, 117, 114, 114),
                        thickness: 0.7,
                        indent: 15,
                        endIndent: 15,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}