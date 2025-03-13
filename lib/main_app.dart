import 'package:flutter/material.dart';
import 'package:green_fit/core/settings/colores.dart';
import 'package:green_fit/core/settings/parametros.dart';
import 'package:green_fit/display/screens/navigation_bar_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Parametros.tituloApp,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colores.colorSemilla),
        useMaterial3: true,
      ),
      home: const NavigationBarPage(),
    );
  }
}
