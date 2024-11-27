import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/screens/screens.dart';
import 'package:flutter_app/providers/theme_provider.dart';
//import 'package:flutter_app/themes/default_theme.dart';
import 'package:flutter_app/helpers/preferences.dart';
import 'package:flutter_app/screens/movies/movies_list_screen.dart';  // Añadir esta línea
import 'package:flutter_app/screens/movies/movie_details_screen.dart';  // Añadir esta línea

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isDarkMode = await Preferences.getThemePreference();
  runApp(MyApp(isDarkMode: isDarkMode));
}

class MyApp extends StatelessWidget {
  final bool isDarkMode;

  const MyApp({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkMode: isDarkMode),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter App',
            theme: themeProvider.temaActual,
            initialRoute: 'home',
            routes: {
              'home': (context) => const HomeScreen(),
              'profile': (context) => const ProfileScreen(),
              'series': (context) =>  SeriesScreen(),
              //'actors': (context) => const ...(),
              //'movies': (context) => const ...(),
              'movies': (context) => const MoviesListScreen(),  // Añadir esta línea
              'movie_details': (context) => const MovieDetailsScreen(),  // Añadir esta línea
            },
          );
        },
      ),
    );
  }
}
