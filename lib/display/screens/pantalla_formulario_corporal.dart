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
  String? _sexoSeleccionado = 'Hombre';
  String _consulta = "";
  bool? _checkDeportista = false;
  bool _mostrarDeporte = false;

  final List<String> _listaSexo = ['Hombre', 'Mujer'];

  final _idForm = GlobalKey<FormState>();
  final _edadTextController = TextEditingController();
  final _deporteTextController = TextEditingController();
  final _problemaSaludTextController = TextEditingController();

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
        key: _idForm,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              combo(),
              InputFormulario(
                label: 'Edad (en años)',
                icono: Iconos.campoEdad,
                numeroFilas: 1,
                textInputType: TextInputType.number,
                controller: _edadTextController,
                validator: (valor) {
                  return ValidacionesData.validarNumeroEntero(valor);
                },
              ),
              CheckboxListTile(
                checkColor: Colores.colorContraSemilla,
                activeColor: Colores.colorSemilla,
                value: _checkDeportista,
                title: Text('Soy deportista calificado'),
                onChanged: (val) {
                  setState(() {
                    _checkDeportista = val;
                    val == true
                        ? _mostrarDeporte = true
                        : _mostrarDeporte = false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              Visibility(
                visible: _mostrarDeporte,
                child: InputFormulario(
                  label: 'Deporte que practico',
                  icono: Icons.sports_baseball,
                  numeroFilas: 1,
                  textInputType: TextInputType.text,
                  controller: _deporteTextController,
                  validator: (valor) {
                    if (_checkDeportista == true) {
                      return ValidacionesData.validarCampoObligatorio(valor);
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              Text('Problemas de salud (opcional):'),
              InputFormulario(
                label: 'Padece algún problema de salud?',
                icono: Iconos.campoProblemaSalud,
                textInputType: TextInputType.text,
                numeroFilas: 2,
                controller: _problemaSaludTextController,
              ),
              ElevatedButton(
                onPressed: () {
                  final esValido = _idForm.currentState?.validate();
                  if (esValido == true) {
                    _consulta = generarConsulta();
                  }
                  print(_consulta);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colores.colorSemilla,
                  foregroundColor: Colores.colorContraSemilla,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text('GENERAR RUTINA'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String generarConsulta() {
    _consulta = "Soy un";
    (_sexoSeleccionado == 'Mujer')
        ? _consulta += "a mujer"
        : _consulta += " hombre de sexo masculino";
    if (_edadTextController.text.isNotEmpty) {
      // validar numero entero
      _consulta += " de ${_edadTextController.text} años de edad";
    }
    if (_checkDeportista == true && _deporteTextController.text.isNotEmpty) {
      _consulta +=
          ", soy deportista calificado, practico ${_deporteTextController.text}";
    }
    if (_problemaSaludTextController.text.isNotEmpty) {
      _consulta += ", tengo problemas de ${_problemaSaludTextController.text}";
    }
    _consulta += ". Que rutinas me sugieres seguir en un gimnasio?";
    _consulta += " Dame el resultado en formato json";
    return _consulta;
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
    );
  }
}
