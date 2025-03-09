import 'package:green_fit/core/configs/mensajes.dart';

class ValidacionesData {
  static String? validarCampoObligatorio(String? valor) {
    if (valor == null) {
      return Mensajes.msgCampoObligatorio;
    }
    if (valor.isEmpty) {
      return Mensajes.msgCampoObligatorio;
    }
    return null;
  }

  static String? validarNumeroEntero(String? valor) {
    if (valor == null) {
      return Mensajes.msgCampoObligatorio;
    }
    if (valor.isEmpty) {
      return Mensajes.msgCampoObligatorio;
    }
    if (int.tryParse(valor) == null) {
      return Mensajes.msgNumeroEntero;
    }
    return null;
  }

  static String? validarNumeroDecimal(String? valor) {
    if (valor == null) {
      return Mensajes.msgCampoObligatorio;
    }
    if (valor.isEmpty) {
      return Mensajes.msgCampoObligatorio;
    }
    if (double.tryParse(valor) == null) {
      return Mensajes.msgNumeroDecimal;
    }
    return null;
  }
}
