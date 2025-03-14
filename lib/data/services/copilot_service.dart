import 'package:dio/dio.dart';
import 'package:green_fit/core/configs/copilot_config.dart';

class CopilotService {
  final Dio _dio = Dio();

  Future<dynamic> generarRutina(String mensaje) async {
    // print(mensaje);
    try {
      final response = await _dio.post(
        CopilotConfig.baseUrl,
        data: {'goal': mensaje},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer ${CopilotConfig.apiKey}",
          },
        ),
      );
      // print(response.data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Falla en el servicio de generar rutinas');
      }
    } catch (excepcion) {
      // print("Error: $excepcion");
      return null;
    }
  }
}
