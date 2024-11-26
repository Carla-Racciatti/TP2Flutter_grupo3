import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text("Menú")),
          ListTile(
            title: Text("Opción 1"),
            onTap: () {
              // Acción para la opción 1
            },
          ),
        ],
      ),
    );
  }
}
