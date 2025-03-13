// import "package:green_fit/display/screens/menu2/my_menu.dart";
import 'package:flutter/material.dart';
import 'package:green_fit/main_app.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:green_fit/core/settings/colores.dart';
// import 'package:green_fit/core/settings/parametros.dart';
// import 'package:green_fit/display/routes/routes.dart';
// import 'package:green_fit/display/screens/pagina_principal.dart';
// import 'package:green_fit/display/screens/pantalla_formulario_corporal.dart';
// // import 'package:green_fit/display/screens/pruebas_openai.dart';
// // import 'package:green_fit/display/screens/pruebas_gemini.dart';

// void main() async {
//   await dotenv.load();
//   runApp(const MyApp());
// }

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

// ignore_for_file: avoid_redundant_argument_values

// void main() => runApp(const MyMenu());
void main() => runApp(const MainApp());
