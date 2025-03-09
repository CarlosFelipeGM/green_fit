import 'package:dio/dio.dart';
import 'package:green_fit/core/configs/config_gemini.dart';

class GeminiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ConfigGemini.baseUrl,
      headers: {"Content-Type": "application/json"},
    ),
  );

  Future<String?> getChatResponse(String mensaje) async {
    // print(mensaje);
    try {
      final response = await _dio.post(
        "?key=${ConfigGemini.apiKey}",
        data: {
          "contents": [
            {
              "parts": [
                {"text": mensaje},
              ],
            },
          ],
        },
      );
      // print(response.data);
      return response.data['candidates'][0]['content']['parts'][0]['text'];
    } catch (e) {
      // print("Error: $e");
      return null;
    }
  }
}
