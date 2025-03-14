import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddRoutineScreen extends StatefulWidget {
  const AddRoutineScreen({super.key});

  @override
  State<AddRoutineScreen> createState() => _AddRoutineScreenState();
}

class _AddRoutineScreenState extends State<AddRoutineScreen> {
  final _formKey = GlobalKey<FormState>();
  String _routineName = '';
  String _description = '';
  int _duration = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Rutina')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre de la Rutina'),
                onSaved: (value) => _routineName = value!,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Este campo es requerido' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                onSaved: (value) => _description = value!,
                validator:
                    (value) =>
                        value!.isEmpty ? 'Este campo es requerido' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Duración (minutos)'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _duration = int.parse(value!),
                validator:
                    (value) =>
                        value!.isEmpty ? 'Este campo es requerido' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Guardar Rutina'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí llamarás a la función para guardar la rutina en Firebase
      _saveRoutineToFirebase();
    }
  }

  void _saveRoutineToFirebase() async {
    CollectionReference routines = FirebaseFirestore.instance.collection(
      'routines',
    );

    await routines.add({
      'name': _routineName,
      'description': _description,
      'duration': _duration,
      'timestamp': FieldValue.serverTimestamp(),
    });

    // Muestra un mensaje de éxito
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Rutina guardada exitosamente')));

    // Limpia el formulario
    _formKey.currentState!.reset();
  }
}
