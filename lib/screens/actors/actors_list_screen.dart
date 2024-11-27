import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import '../../mocks/actors_mock.dart';
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
        title: 'Actors',
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
                      child: Center(child: Text('This is the end of the list')),
                    );
                  }

                  return Column(
                    children: [
                      CustomListTile(actor: actors[index]),
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


/*import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import '../../mocks/actors_mock.dart';
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
        title: 'Actors',
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
                    : actors.length + (hasMoreActors ? 1 : 0),
                itemBuilder: (context, index) {
                  if (actors.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('No coincidences')),
                    );
                  }

                  if (index == actors.length) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('No more actors to load')),
                    );
                  }

                  return Column(
                    children: [
                      CustomListTile(actor: actors[index]),
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
*/



/*import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import '../../mocks/actors_mock.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Actors',
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
                  if (actors.length < actorsMocks.length) {
                    currentIndex += 5;
                    _loadMoreActors();
                  }
                }
                return false;
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),  // Efecto de rebote al llegar al final
                itemCount: actors.isEmpty ? 1 : actors.length, // Muestra "No coincidencias" si no hay actores
                itemBuilder: (context, index) {
                  if (actors.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('No coincidences')),
                    );
                  }
                  return Column(
                    children: [
                      CustomListTile(actor: actors[index]),
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
*/

/*import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import '../../mocks/actors_mock.dart';
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

  @override
  void initState() {
    super.initState();
    _loadMoreActors();
  }

  void _loadMoreActors() {
    // Filtramos actores si hay un query de búsqueda
    setState(() {
      List<dynamic> filteredActors = actorsMocks
          .where((actor) =>
              actor['name'].toLowerCase().contains(searchQuery.toLowerCase()) ||
              actor['id'].toString().contains(searchQuery))
          .toList();

      // Cargamos los actores según el índice actual y el tamaño de página
      actors = filteredActors.sublist(0, (currentIndex + pageSize) > filteredActors.length
          ? filteredActors.length
          : currentIndex + pageSize);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Actores"),
      ),*/
      appBar: const CustomAppBar(
        title: 'Actors',
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
                // Verifica si llegamos al final de la lista
                if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  if (actors.length < actorsMocks.length) {
                    // Cargar más actores cuando llegue al final
                    currentIndex += 5;
                    _loadMoreActors();
                  }
                }
                return false;
              },
              child: ListView.builder(
                physics: BouncingScrollPhysics(),  // Efecto de rebote al llegar al final
                itemCount: actors.length + 1, // Agrega un item extra para el "Cargando más"
                itemBuilder: (context, index) {
                  if (index == actors.length) {
                    // Si no hay más actores, no mostramos el círculo de carga
                    if (actors.length < actorsMocks.length) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text('No more actors to load')),
                      );
                    }
                  }
                  return Column(
                    children: [
                      CustomListTile(actor: actors[index]),  // Pasamos el actor completo
                      Divider(
                        color: const Color.fromARGB(255, 117, 114, 114),  // Color de la línea
                        thickness: 0.7,  // Grosor de la línea
                        indent: 15,  // Indentación desde el inicio
                        endIndent: 15,  // Indentación desde el final
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
*/