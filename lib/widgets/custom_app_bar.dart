import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title, // Título dinámico para personalizar la AppBar
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      leadingWidth: 40,
      toolbarHeight: 60,
      backgroundColor: const Color.fromARGB(200, 235, 0, 0),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
