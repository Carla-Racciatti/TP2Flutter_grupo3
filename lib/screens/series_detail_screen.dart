import 'package:flutter/material.dart';

class SeriesDetailScreen extends StatelessWidget {
  final int seriesIndex; // El parámetro requerido

  // Asegúrate de que el constructor reciba el seriesIndex
  SeriesDetailScreen({Key? key, required this.seriesIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles de la Serie $seriesIndex"), // Muestra el índice de la serie
      ),
      body: Center(
        child: Text("Aquí van los detalles de la serie $seriesIndex"),
      ),
    );
  }
}
