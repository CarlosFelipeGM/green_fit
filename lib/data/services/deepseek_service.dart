import 'package:dio/dio.dart';
import 'package:green_fit/core/configs/config_deepseek.dart';
import 'package:green_fit/data/models/deepseek_model.dart';

class DeepseekService {
  final Dio _dio = Dio();

  Future<DeepseekModel?> generateRoutine(String mensaje) async {
    // print(mensaje);
    try {
      final response = await _dio.post(
        ConfigDeepseek.baseUrl,
        data: {'goal': mensaje},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer ${ConfigDeepseek.apiKey}",
          },
        ),
      );
      // print(response.data);
      if (response.statusCode == 200) {
        return DeepseekModel.fromJson(response.data);
      } else {
        throw Exception('Falla en el servicio de generar rutinas');
      }
    } catch (excepcion) {
      // print("Error: $excepcion");
      return null;
    }
  }
}
