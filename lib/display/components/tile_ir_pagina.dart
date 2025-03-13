import 'package:flutter/material.dart';
import 'package:green_fit/core/settings/iconos.dart';

class TileIrPagina extends StatelessWidget {
  final String texto;
  final VoidCallback alPresionar;

  const TileIrPagina({
    required this.texto,
    required this.alPresionar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(texto),
      trailing: Icon(Iconos.irPagina),
      onTap: alPresionar,
    );
  }
}
