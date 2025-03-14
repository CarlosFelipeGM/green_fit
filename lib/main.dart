// import "package:green_fit/display/screens/menu2/my_menu.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:green_fit/display/screens/add_routine_screen.dart';
import 'package:green_fit/display/screens/auth_screen.dart';
import 'package:green_fit/display/screens/home_screen.dart';
// import 'package:green_fit/display/screens/routine_list_screen.dart';
import 'package:green_fit/firebase_options.dart';
// import 'package:green_fit/main_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:green_fit/core/settings/colores.dart';
// import 'package:green_fit/core/settings/parametros.dart';
// import 'package:green_fit/display/routes/routes.dart';
// import 'package:green_fit/display/screens/pagina_principal.dart';
// import 'package:green_fit/display/screens/pantalla_formulario_corporal.dart';
// // import 'package:green_fit/display/screens/pruebas_openai.dart';
// // import 'package:green_fit/display/screens/pruebas_gemini.dart';

void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Verificar si hay un usuario recordado
  final prefs = await SharedPreferences.getInstance();
  final userEmail = prefs.getString('userEmail');
  runApp(MyApp(userEmail: userEmail));
}

class MyApp extends StatelessWidget {
  final String? userEmail;
  const MyApp({this.userEmail, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rutinas de Ejercicios',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: RoutineListScreen(),
      // routes: {'/add': (context) => AddRoutineScreen()},
      home: AuthScreen(),
      routes: {'/home': (context) => HomeScreen()},
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return BlocProvider(
//     //   create: (_) => RutinaBloc(rutinaService: DeepseekService()),
//     //   child: MaterialApp(
//     //     debugShowCheckedModeBanner: false,
//     //     title: Parametros.tituloApp,
//     //     theme: ThemeData(
//     //       colorScheme: ColorScheme.fromSeed(seedColor: Colores.colorSemilla),
//     //       useMaterial3: true,
//     //     ),
//     //     home: PruebasDeepseek(),
//     //   ),
//     // );
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: Parametros.tituloApp,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colores.colorSemilla),
//         useMaterial3: true,
//       ),
//       initialRoute: Routes.home,
//       routes: {
//         Routes.home: (_) => const PaginaPrincipal(),
//         Routes.formularioCorporal: (_) => const PantallaFormularioCorporal(),
//       },
//       // home: PruebasOpenAI(),
//       // home: PruebasGemini(),
//     );
//   }
// }
