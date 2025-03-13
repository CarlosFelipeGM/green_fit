import 'package:flutter/material.dart';
import 'package:green_fit/core/settings/colores.dart';

class CheckFormulario extends StatelessWidget {
  final bool? seleccionado;
  final String texto;
  final ValueChanged<bool?> alPresionar;

  const CheckFormulario({
    required this.seleccionado,
    required this.texto,
    required this.alPresionar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkColor: Colores.colorContraSemilla,
      activeColor: Colores.colorSemilla,
      value: seleccionado,
      title: Text(texto),
      onChanged: alPresionar,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
