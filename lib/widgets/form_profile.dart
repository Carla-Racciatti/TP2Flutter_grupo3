import 'package:flutter/material.dart';
import 'package:flutter_app/helpers/preferences.dart';

class FormProfile extends StatefulWidget {
  const FormProfile({Key? key}) : super(key: key);

  @override
  _FormProfileState createState() => _FormProfileState();
}

class _FormProfileState extends State<FormProfile> {
  late Future<String> _telefonoFuture;
  late Future<String> _emailFuture;
  late Future<String> _apellidoFuture;
  late Future<String> _nombreFuture;

  @override
  void initState() {
    super.initState();
    // Inicializamos las variables future con los métodos asincrónicos.
    _telefonoFuture = Preferences.getTelefono();
    _emailFuture = Preferences.getEmail();
    _apellidoFuture = Preferences.getApellido();
    _nombreFuture = Preferences.getNombre();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([_telefonoFuture, _emailFuture, _apellidoFuture, _nombreFuture]),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();  // Cargar mientras esperamos.
        }
        
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        // Obtenemos los valores de los datos almacenados.
        final telefono = snapshot.data![0];
        final email = snapshot.data![1];
        final apellido = snapshot.data![2];
        final nombre = snapshot.data![3];

        return Column(
          children: [
            TextFormField(
              initialValue: telefono,
              onChanged: (value) {
                Preferences.setTelefono(value);
              },
              decoration: const InputDecoration(
                labelText: 'Teléfono',
                icon: Icon(Icons.phone), // Aquí usamos el widget Icon con const
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              initialValue: email,
              onChanged: (value) {
                Preferences.setEmail(value);
              },
              decoration: const InputDecoration(
                labelText: 'Email',
                icon: Icon(Icons.alternate_email_outlined), // Aquí también usamos el widget Icon con const
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              initialValue: apellido,
              onChanged: (value) {
                Preferences.setApellido(value);
              },
              decoration: const InputDecoration(
                labelText: 'Apellido',
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              initialValue: nombre,
              onChanged: (value) {
                Preferences.setNombre(value);
              },
              decoration: const InputDecoration(
                labelText: 'Nombre',
              ),
            ),
          ],
        );
      },
    );
  }
}
