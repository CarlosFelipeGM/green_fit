import 'package:dio/dio.dart';
import 'package:green_fit/core/configs/openai_config.dart';

class OpenAIService {
  final Dio _dio = Dio();

  // final Dio _dio = Dio(
  //   BaseOptions(
  //     baseUrl: OpenAIConfig.baseUrl,
  //     headers: {
  //       "Content-Type": "application/json",
  //       "Authorization": "Bearer ${OpenAIConfig.apiKey}",
  //       "OpenAI-Organization": OpenAIConfig.organization,
  //       "OpenAI-Project": OpenAIConfig.idProject,
  //     },
  //   ),
  // );

  Future<String?> request(String strConsulta) async {
    // print(strConsulta);
    try {
      final response = await _dio.post(
        OpenAIConfig.baseUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${OpenAIConfig.apiKey}',
            'Content-Type': 'application/json',
          },
        ),
        data: {
          "model": "gpt-4o-mini",
          'prompt': strConsulta,
          'max_tokens': 100,
        },
      );
      // print("Respuesta: ");
      // print(response);
      return response.data["choices"][0]["text"];
    } catch (e) {
      // print("Error: $e");
      return null;
    }
  }
}
