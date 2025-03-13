import 'package:flutter/material.dart';
import 'package:green_fit/core/settings/colores.dart';

class BotonFormulario extends StatelessWidget {
  final String texto;
  final Function()? alPresionar;

  const BotonFormulario({
    required this.texto,
    required this.alPresionar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: alPresionar,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colores.colorSemilla,
        foregroundColor: Colores.colorContraSemilla,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(texto),
    );
  }
}
