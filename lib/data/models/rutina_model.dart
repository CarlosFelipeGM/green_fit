import 'package:cloud_firestore/cloud_firestore.dart';

class RutinaModel {
  final String id;
  final String nombre;
  final String idUsuario;
  final DateTime? fechaCreacion;

  RutinaModel({
    required this.id,
    required this.nombre,
    required this.idUsuario,
    this.fechaCreacion,
  });

  factory RutinaModel.fromFirestore(Map<String, dynamic> data) {
    return RutinaModel(
      id: data['id'],
      nombre: data['nombre'],
      idUsuario: data['id_usuario'],
      fechaCreacion:
          data['fecha_creacion'] == null
              ? null
              : DateTime.fromMicrosecondsSinceEpoch(
                (data['fecha_creacion'] as Timestamp).microsecondsSinceEpoch,
              ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'id_usuario': idUsuario,
      'fecha_creacion': fechaCreacion,
    };
  }
}
