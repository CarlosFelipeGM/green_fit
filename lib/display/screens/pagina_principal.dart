import 'package:flutter/material.dart';
import 'package:green_fit/core/settings/parametros.dart';
import 'package:green_fit/display/components/tile_ir_pagina.dart';
import 'package:green_fit/display/routes/routes.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Parametros.tituloApp),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TileIrPagina(
            texto: "Formulario Corporal",
            alPresionar: () {
              Navigator.pushNamed(context, Routes.formularioCorporal);
            },
          ),
        ],
      ),
    );
  }
}
