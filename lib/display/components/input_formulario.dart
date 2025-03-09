import 'package:flutter/material.dart';
import 'package:green_fit/core/configs/colores.dart';

class InputFormulario extends StatelessWidget {
  final String label;
  final IconData icono;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;

  const InputFormulario({
    super.key,
    required this.label,
    required this.icono,
    this.controller,
    this.textInputType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        prefixIcon: Icon(icono, color: Colores.colorSemilla),
      ),
    );
  }
}
