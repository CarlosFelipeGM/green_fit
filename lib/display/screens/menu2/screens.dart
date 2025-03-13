import "package:flutter/material.dart";
import "package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart";

class MainScreen extends StatelessWidget {
  const MainScreen({
    required this.menuScreenContext,
    required this.onScreenHideButtonPressed,
    this.scrollController,
    this.onNavBarStyleChanged,
    super.key,
    this.hideStatus = false,
    this.showNavBarStyles = true,
  });
  final BuildContext menuScreenContext;
  final VoidCallback onScreenHideButtonPressed;
  final bool hideStatus;
  final ScrollController? scrollController;
  final Function(NavBarStyle)? onNavBarStyleChanged;
  final bool showNavBarStyles;

  @override
  Widget build(final BuildContext context) => SingleChildScrollView(
    controller: scrollController,
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 6,
      width: MediaQuery.of(context).size.width,
    ),
  );
}
