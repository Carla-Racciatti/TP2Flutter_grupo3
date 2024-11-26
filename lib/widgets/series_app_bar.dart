import 'package:flutter/material.dart';

class SeriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onSearchTap;

  const SeriesAppBar({
    Key? key,
    required this.title,
    required this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'home');  // Vuelve a la pantalla principal
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: onSearchTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
