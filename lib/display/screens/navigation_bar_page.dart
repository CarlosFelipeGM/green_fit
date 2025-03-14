import 'package:flutter/material.dart';
import 'package:green_fit/core/settings/colores.dart';
import 'package:green_fit/core/settings/iconos.dart';
import 'package:green_fit/core/settings/parametros.dart';
import 'package:green_fit/core/settings/textos.dart';
import 'package:green_fit/display/screens/mis_preferencias.dart';
import 'package:green_fit/display/screens/mis_progresos_page.dart';
import 'package:green_fit/display/screens/mis_retos_page.dart';
import 'package:green_fit/display/screens/mis_rutinas_page.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final ThemeData theme = Theme.of(context);
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      // appBar: MyAppBar(context: context),
      appBar: AppBar(
        title: const Text(Parametros.tituloApp),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: <Widget>[
          const Text('Carlos Gomez'),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      drawer: const Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Menu lateral")],
          ),
        ),
      ),
      body:
          <Widget>[
            const MisRutinasPage(),
            const MisRetosPage(),
            const MisProgresosPage(),
            const MisPreferencias(),
          ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colores.colorSemilla,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Iconos.misRutinas),
            label: Textos.txtMisRutinas,
          ),
          NavigationDestination(
            icon: Icon(Iconos.misRetos),
            label: Textos.txtMisRetos,
          ),
          NavigationDestination(
            icon: Icon(Iconos.misProgresos),
            label: Textos.txtMisProgresos,
          ),
          NavigationDestination(
            icon: Icon(Iconos.miconfiguracion),
            label: Textos.txtMiConfiguracion,
          ),
        ],
      ),
    );
  }
}
