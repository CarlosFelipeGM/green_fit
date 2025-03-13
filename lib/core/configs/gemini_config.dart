import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigGemini {
  static String apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  static String projectNumber = dotenv.env['GEMINI_PROJECT_NUMBER'] ?? '';
  static const String baseUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent";
}
