import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals/presentaion/screens/tabs.dart';

/// Global theme configuration for the Meals app.
/// 
/// Features a dark theme with orange-brown primary color and Figtree font family.
/// This theme provides a modern, culinary-focused appearance suitable for a recipe app.
final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0), // Orange-brown color
  ),
  textTheme: GoogleFonts.figtreeTextTheme(), // Modern, readable font
);

/// Application entry point.
/// 
/// Initializes and runs the Meals app with the configured theme.
void main() {
  runApp(const App());
}

/// Root widget of the Meals application.
/// 
/// Configures the MaterialApp with the custom theme and sets TabsScreen
/// as the initial route. The app uses a dark theme optimized for
/// recipe browsing and management.
class App extends StatelessWidget {
  /// Creates the root App widget.
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      theme: theme, // Apply custom theme
      home: TabsScreen(), // Set initial screen
    );
  }
}
