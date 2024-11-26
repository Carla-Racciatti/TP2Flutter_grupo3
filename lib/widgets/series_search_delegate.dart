import 'package:flutter/material.dart';

class SeriesSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Limpia la búsqueda
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Cierra la búsqueda
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Aquí puedes definir cómo mostrar los resultados de la búsqueda
    return Center(
      child: Text('Resultados de la búsqueda para: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Aquí puedes mostrar sugerencias mientras el usuario escribe
    return ListView(
      children: [
        ListTile(title: Text('Sugerencia 1')),
        ListTile(title: Text('Sugerencia 2')),
      ],
    );
  }
}
