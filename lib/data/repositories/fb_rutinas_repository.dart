// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:green_fit/core/exceptions.dart';
// import 'package:green_fit/data/models/rutina_model.dart';

// class FbRutinasRepository {
//   final cloudFirestore = FirebaseFirestore.instance;
//   final firebaseAuth = FirebaseAuth.instance;

//   Future<List<RutinaModel>> obtenerRutinas() async {
//     try {
//       final userId = firebaseAuth.currentUser?.uid;
//       if (userId == null) {
//         throw ExceptionObtenerRutina();
//       }

//       final querySnapshot =
//           await cloudFirestore
//               .collection('rutinas')
//               .where('id_usuario', isEqualTo: userId)
//               .get();

//       final docs = querySnapshot.docs;

//       final listaRutinas = List<RutinaModel>.from(
//         docs.map<RutinaModel>((doc) {
//           final data = doc.data();
//           return RutinaModel.fromFirestore(data);
//         }),
//       );

//       return listaRutinas;
//     } catch (e) {
//       throw ExceptionObtenerRutina();
//     }
//   }

//   Stream<List<RutinaModel>> obtenerFlujoDeGastos() {
//     try {
//       final userId = firebaseAuth.currentUser?.uid;
//       if (userId == null) {
//         throw ExceptionObtenerRutina();
//       }

//       return cloudFirestore.collection('gastos').snapshots().asyncMap((
//         querySnanpshot,
//       ) {
//         final docs = querySnanpshot.docs;

//         final listaRutinas = List<RutinaModel>.from(
//           docs.map<RutinaModel>((doc) {
//             final data = doc.data();
//             return RutinaModel.fromFirestore(data);
//           }),
//         );

//         return listaRutinas;
//       });
//     } catch (e) {
//       throw ExceptionObtenerRutina();
//     }
//   }

//   Future<void> borrarRutina(RutinaModel rutina) async {
//     try {
//       await cloudFirestore.collection('rutinas').doc(rutina.id).delete();
//     } catch (e) {
//       throw ExceptionAlBorrarRutina();
//     }
//   }

//   Future<void> guardarRutina({
//     required String descripcion,
//     required double monto,
//   }) async {
//     try {
//       final userId = firebaseAuth.currentUser?.uid;
//       if (userId == null) {
//         throw ExcepcionGuardarGasto();
//       }
//       final idFirebase = cloudFirestore.collection('gastos').doc().id;

//       final gasto = Gasto(
//         id: idFirebase,
//         descripcion: descripcion,
//         monto: monto,
//         idUsuario: userId,
//         fechaCreacion: DateTime.now(),
//       );

//       await cloudFirestore
//           .collection('gastos')
//           .doc(idFirebase)
//           .set(gasto.toMap());
//     } catch (e) {
//       throw ExcepcionGuardarGasto();
//     }
//   }
// }
