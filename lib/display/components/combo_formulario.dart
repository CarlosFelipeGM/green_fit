import 'package:flutter/material.dart';
import 'package:green_fit/core/settings/colores.dart';
import 'package:green_fit/core/settings/iconos.dart';

class ComboFormulario extends StatelessWidget {
  final List<String> lista;
  final String? seleccionado;
  final String label;
  final String preText;
  final ValueChanged<String?> alPresionar;

  const ComboFormulario({
    required this.lista,
    required this.seleccionado,
    required this.label,
    required this.preText,
    required this.alPresionar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: seleccionado,
      items:
          lista
              .map(
                (e) => DropdownMenuItem(value: e, child: Text("$preText $e")),
              )
              .toList(),
      onChanged: alPresionar,
      icon: const Icon(Iconos.dropDown, color: Colores.colorSemilla),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Iconos.campoSexo, color: Colores.colorSemilla),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
