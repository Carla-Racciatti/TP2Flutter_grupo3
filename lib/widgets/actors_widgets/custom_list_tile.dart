import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Map<String, dynamic> actor; // Aceptamos un mapa como parámetro
  final VoidCallback onTap;

  //CustomListTile({required this.actor});  

  const CustomListTile({
    Key? key,
    required this.actor,
    required this.onTap,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      title: Text(actor['name'], style: TextStyle(fontSize: 20), ), // Mostrar el nombre del actor
      subtitle: Text(actor['knownfor'].join(', ')), // Mostrar las películas/series conocidas
      leading: actor['profileImage'] != null
          ? Image.network(actor['profileImage']) // Mostrar la imagen del actor si existe
          : Icon(Icons.person), // Si no hay imagen, mostrar un ícono por defecto
    );
  }
}