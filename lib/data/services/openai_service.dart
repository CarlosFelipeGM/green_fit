import 'package:dio/dio.dart';
import 'package:green_fit/core/configs/config_openai.dart';

class OpenAIService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ConfigOpenAI.baseUrl,
      headers: {
        "Authorization": "Bearer ${ConfigOpenAI.apiKey}",
        "OpenAI-Organization": ConfigOpenAI.organization,
        "OpenAI-Project": ConfigOpenAI.idProject,
        "Content-Type": "application/json",
      },
    ),
  );

  Future<String?> getChatResponse(String mensaje) async {
    // print(mensaje);
    try {
      final response = await _dio.post(
        "/chat/completions",
        data: {
          "model": "gpt-4o-mini",
          "messages": [
            {"role": "system", "content": "Eres un entrenador de gimnasio."},
            {"role": "user", "content": mensaje},
          ],
        },
      );
      // print(response);
      return response.data["choices"][0]["message"]["content"];
    } catch (e) {
      // print("Error: $e");
      return null;
    }
  }
}
