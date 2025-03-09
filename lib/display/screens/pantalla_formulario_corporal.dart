import 'package:flutter/material.dart';
import 'package:green_fit/core/configs/colores.dart';
import 'package:green_fit/core/configs/iconos.dart';
import 'package:green_fit/core/configs/parametros.dart';
import 'package:green_fit/display/components/input_formulario.dart';
import 'package:green_fit/display/utils/validaciones_data.dart';

const List<String> listaSexo = ['Hombre', 'Mujer', 'LGBT'];

class PantallaFormularioCorporal extends StatefulWidget {
  const PantallaFormularioCorporal({super.key});

  @override
  State<PantallaFormularioCorporal> createState() =>
      _PantallaFormularioCorporalState();
}

class _PantallaFormularioCorporalState
    extends State<PantallaFormularioCorporal> {
  String? _sexoSeleccionado;
  final List<String> _listaSexo = ['Hombre', 'Mujer'];

  final _formKey = GlobalKey<FormState>();
  final _edadTextController = TextEditingController();
  final _saludUnoTextController = TextEditingController();
  final _saludDosTextController = TextEditingController();
  final _saludTresTextController = TextEditingController();
  final _saludCuatroTextController = TextEditingController();
  final _saludCincoTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "${Parametros.tituloApp} - ${Parametros.tituloFormularioCorporal}",
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              combo(),
              InputFormulario(
                label: 'Edad',
                icono: Iconos.campoEdad,
                textInputType: TextInputType.number,
                controller: _edadTextController,
                validator: (valor) {
                  return ValidacionesData.validarNumeroEntero(valor);
                },
              ),
              Text('Problemas de salud (opcional):'),
              InputFormulario(
                label: 'Primer problema de salud',
                icono: Iconos.campoProblemaSalud,
                textInputType: TextInputType.text,
                controller: _saludUnoTextController,
              ),
              InputFormulario(
                label: 'Segundo problema de salud',
                icono: Iconos.campoProblemaSalud,
                textInputType: TextInputType.text,
                controller: _saludDosTextController,
              ),
              InputFormulario(
                label: 'Tercer problema de salud',
                icono: Iconos.campoProblemaSalud,
                textInputType: TextInputType.text,
                controller: _saludTresTextController,
              ),
              InputFormulario(
                label: 'Cuarto problema de salud',
                icono: Iconos.campoProblemaSalud,
                textInputType: TextInputType.text,
                controller: _saludCuatroTextController,
              ),
              InputFormulario(
                label: 'Quinto problema de salud',
                icono: Iconos.campoProblemaSalud,
                textInputType: TextInputType.text,
                controller: _saludCincoTextController,
              ),
            ],
          ),
        ),
      ),
    );
  }

  DropdownButtonFormField<String> combo() {
    return DropdownButtonFormField(
      value: _sexoSeleccionado,
      items:
          _listaSexo
              .map(
                (e) => DropdownMenuItem(value: e, child: Text("Sexo --> $e")),
              )
              .toList(),
      onChanged: (String? val) {
        setState(() {
          _sexoSeleccionado = val;
        });
      },
      icon: const Icon(Iconos.dropDown, color: Colores.colorSemilla),
      decoration: InputDecoration(
        labelText: "Género del Usuario",
        prefixIcon: Icon(Iconos.campoSexo, color: Colores.colorSemilla),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      hint: Text('Hombre o Mujer?'),
    );
  }
}
