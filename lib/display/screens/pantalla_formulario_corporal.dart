import 'package:flutter/material.dart';
import 'package:green_fit/core/settings/iconos.dart';
import 'package:green_fit/core/settings/parametros.dart';
import 'package:green_fit/core/settings/textos.dart';
import 'package:green_fit/display/components/boton_formulario.dart';
import 'package:green_fit/display/components/check_formulario.dart';
import 'package:green_fit/display/components/combo_formulario.dart';
import 'package:green_fit/display/components/input_formulario.dart';
import 'package:green_fit/display/utils/validaciones_data.dart';

enum Genero {
  hombre(texto: 'Hombre', enConsulta: ' hombre de sexo masculino'),
  mujer(texto: 'Mujer', enConsulta: 'a mujer');

  final String texto;
  final String enConsulta;

  const Genero({required this.texto, required this.enConsulta});
}

class PantallaFormularioCorporal extends StatefulWidget {
  const PantallaFormularioCorporal({super.key});

  @override
  State<PantallaFormularioCorporal> createState() =>
      _PantallaFormularioCorporalState();
}

class _PantallaFormularioCorporalState
    extends State<PantallaFormularioCorporal> {
  // por defecto seleccionamos el sexo hombre
  String? _sexoSeleccionado = Genero.hombre.texto;
  String _consulta = "";
  bool? _checkDeportista = false;
  bool _mostrarDeporte = false;
  bool? _checkGruposMusculares = false;
  bool _mostrarGruposMusculares = false;
  bool? _checkProblemasDeSalud = false;
  bool _mostrarProblemasDeSalud = false;

  final List<String> _listaSexo = [Genero.hombre.texto, Genero.mujer.texto];

  final _idForm = GlobalKey<FormState>();
  final _edadTextController = TextEditingController();
  final _deporteTextController = TextEditingController();
  final _gruposMuscularesTextController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Form(
          key: _idForm,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // combo SELECTOR DE SEXO
                ComboFormulario(
                  lista: _listaSexo,
                  seleccionado: _sexoSeleccionado,
                  label: Textos.txtGeneroUsuario,
                  preText: Textos.txtPreComboSexo,
                  alPresionar: (String? val) {
                    setState(() {
                      _sexoSeleccionado = val;
                    });
                  },
                ),
                SizedBox(height: 12),
                // textField EDAD
                InputFormulario(
                  label: Textos.txtEdad,
                  icono: Iconos.campoEdad,
                  numeroFilas: 1,
                  textInputType: TextInputType.number,
                  controller: _edadTextController,
                  validator: (valor) {
                    return ValidacionesData.validarNumeroEntero(valor);
                  },
                ),
                // check ENFATIZAR
                CheckFormulario(
                  seleccionado: _checkGruposMusculares,
                  texto: "${Textos.txtEnfasis} ${Textos.txtOpcional}:",
                  alPresionar: (val) {
                    setState(() {
                      _checkGruposMusculares = val;
                      _mostrarGruposMusculares = (val == true);
                    });
                  },
                ),
                Visibility(
                  visible: _mostrarGruposMusculares,
                  child: InputFormulario(
                    label: Textos.txtPartesDelCuerpo,
                    icono: Iconos.campoPartesDelCuerpo,
                    numeroFilas: 2,
                    textInputType: TextInputType.text,
                    controller: _gruposMuscularesTextController,
                    validator: (valor) {
                      return (_checkGruposMusculares == true)
                          ? ValidacionesData.validarCampoObligatorio(valor)
                          : null;
                    },
                  ),
                ),
                // check DEPORTISTA CALIFICADO
                CheckFormulario(
                  seleccionado: _checkDeportista,
                  texto:
                      "${Textos.txtDeportistaCalificado} ${Textos.txtOpcional}:",
                  alPresionar: (val) {
                    setState(() {
                      _checkDeportista = val;
                      _mostrarDeporte = (val == true);
                    });
                  },
                ),
                Visibility(
                  visible: _mostrarDeporte,
                  child: InputFormulario(
                    label: Textos.txtDeportePracticado,
                    icono: Iconos.campoDeportes,
                    numeroFilas: 1,
                    textInputType: TextInputType.text,
                    controller: _deporteTextController,
                    validator: (valor) {
                      return (_checkDeportista == true)
                          ? ValidacionesData.validarCampoObligatorio(valor)
                          : null;
                    },
                  ),
                ),
                // check PROBLEMAS DE SALUD
                CheckFormulario(
                  seleccionado: _checkProblemasDeSalud,
                  texto: "${Textos.txtProblemaSalud} ${Textos.txtOpcional}:",
                  alPresionar: (val) {
                    setState(() {
                      _checkProblemasDeSalud = val;
                      _mostrarProblemasDeSalud = (val == true);
                    });
                  },
                ),
                Visibility(
                  visible: _mostrarProblemasDeSalud,
                  child: InputFormulario(
                    label: Textos.txtPadecimientoSalud,
                    icono: Iconos.campoProblemaSalud,
                    textInputType: TextInputType.text,
                    numeroFilas: 2,
                    controller: _problemaSaludTextController,
                    validator: (valor) {
                      return (_checkProblemasDeSalud == true)
                          ? ValidacionesData.validarCampoObligatorio(valor)
                          : null;
                    },
                  ),
                ),
                SizedBox(height: 12),
                // boton GENERAR RUTINA
                BotonFormulario(
                  texto: Textos.txtBotonGenerarRutina,
                  alPresionar: () {
                    final esValido = _idForm.currentState?.validate();
                    if (esValido == true) {
                      _consulta = _generarTextoConsulta();
                    }
                    FocusManager.instance.primaryFocus?.unfocus();
                    print(_consulta);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _edadTextController.dispose();
    _gruposMuscularesTextController.dispose();
    _deporteTextController.dispose();
    _problemaSaludTextController.dispose();
  }

  String _generarTextoConsulta() {
    _consulta = "Soy un";
    (_sexoSeleccionado == Genero.mujer.texto)
        ? _consulta += Genero.mujer.enConsulta
        : _consulta += Genero.hombre.enConsulta;
    if (_edadTextController.text.isNotEmpty) {
      _consulta += " de ${_edadTextController.text} años de edad";
    }
    if (_checkDeportista == true && _deporteTextController.text.isNotEmpty) {
      _consulta +=
          ", soy deportista calificado, practico ${_deporteTextController.text}";
    }
    if (_checkProblemasDeSalud == true &&
        _problemaSaludTextController.text.isNotEmpty) {
      _consulta += ", tengo problemas de ${_problemaSaludTextController.text}";
    }
    _consulta += ". Que rutinas me sugieres seguir en un gimnasio?";
    if (_checkGruposMusculares == true &&
        _gruposMuscularesTextController.text.isNotEmpty) {
      _consulta += " Dar énfasis en: ${_gruposMuscularesTextController.text}.";
    }
    _consulta += " Dame el resultado en formato json";
    return _consulta;
  }
}
