import "package:flutter/material.dart";
import "package:green_fit/core/settings/colores.dart";
import "package:green_fit/core/settings/parametros.dart";
import "package:green_fit/display/screens/menu2/screens.dart";
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

class MyMenu extends StatelessWidget {
  const MyMenu({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: Parametros.tituloApp,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colores.colorSemilla),
      useMaterial3: true,
    ),
    home: const MainMenu(),
    initialRoute: "/",
  );
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(Parametros.tituloApp),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: ElevatedButton(
            child: const Text("Mostrar Menu"),
            onPressed:
                () => PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: ProvidedStyles(menuScreenContext: context),
                ),
          ),
        ),
      ],
    ),
  );
}

// ----------------------------------------- Provided Style ----------------------------------------- //

class ProvidedStyles extends StatefulWidget {
  const ProvidedStyles({required this.menuScreenContext, super.key});
  final BuildContext menuScreenContext;

  @override
  State<ProvidedStyles> createState() => _ProvidedStylesState();
}

class _ProvidedStylesState extends State<ProvidedStyles> {
  late PersistentTabController _controller;

  NavBarStyle _navBarStyle = NavBarStyle.simple;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() => [
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      onScreenHideButtonPressed: () {
        setState(() {});
      },
      onNavBarStyleChanged:
          (final value) => setState(() => _navBarStyle = value),
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      onScreenHideButtonPressed: () {
        setState(() {});
      },
      onNavBarStyleChanged:
          (final value) => setState(() => _navBarStyle = value),
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      onScreenHideButtonPressed: () {
        setState(() {});
      },
      onNavBarStyleChanged:
          (final value) => setState(() => _navBarStyle = value),
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      onScreenHideButtonPressed: () {
        setState(() {});
      },
      onNavBarStyleChanged:
          (final value) => setState(() => _navBarStyle = value),
    ),
    MainScreen(
      menuScreenContext: widget.menuScreenContext,
      onScreenHideButtonPressed: () {
        setState(() {});
      },
      onNavBarStyleChanged:
          (final value) => setState(() => _navBarStyle = value),
    ),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() => [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home),
      title: "Inicio",
      opacity: Parametros.opacidadIconos,
      activeColorPrimary: Colores.colorContraSemilla,
      inactiveColorPrimary: Colores.colorContraInactivo,
      routeAndNavigatorSettings: RouteAndNavigatorSettings(initialRoute: "/"),
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: "Buscar",
      opacity: Parametros.opacidadIconos,
      activeColorPrimary: Colores.colorContraSemilla,
      inactiveColorPrimary: Colores.colorContraInactivo,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add),
      title: "Nuevo",
      opacity: Parametros.opacidadIconos,
      activeColorPrimary: Colores.colorContraSemilla,
      inactiveColorPrimary: Colores.colorContraInactivo,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: "Mensajes",
      opacity: Parametros.opacidadIconos,
      activeColorPrimary: Colores.colorContraSemilla,
      inactiveColorPrimary: Colores.colorContraInactivo,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.search),
      title: "Config",
      opacity: Parametros.opacidadIconos,
      activeColorPrimary: Colores.colorContraSemilla,
      inactiveColorPrimary: Colores.colorContraInactivo,
    ),
  ];

  @override
  Widget build(final BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(Parametros.tituloApp),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    ),
    drawer: const Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("Menu lateral")],
        ),
      ),
    ),
    body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: false,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      popBehaviorOnSelectedNavBarItemPress: PopBehavior.once,
      padding: const EdgeInsets.only(top: 8),
      selectedTabScreenContext: (final context) {
        testContext = context;
      },
      backgroundColor: Colores.colorSemilla,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 300),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
        onNavBarHideAnimation: OnHideAnimationSettings(
          duration: Duration(milliseconds: 100),
          curve: Curves.bounceInOut,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: kBottomNavigationBarHeight,
      navBarStyle: _navBarStyle, // Choose the nav bar style with this property
    ),
  );
}

BuildContext? testContext;
