// import 'package:cloud_firestore/cloud_firestore.dart';

// void SaveRoutineToFirebase() async {
//   CollectionReference routines = FirebaseFirestore.instance.collection('routines');

//   await routines.add({
//     'name': _routineName,
//     'description': _description,
//     'duration': _duration,
//     'timestamp': FieldValue.serverTimestamp(),
//   });

//   // Muestra un mensaje de éxito
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(content: Text('Rutina guardada exitosamente')),
//   );

//   // Limpia el formulario
//   _formKey.currentState!.reset();
// }
