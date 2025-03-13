import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenAIConfig {
  static String apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';
  static String organization = dotenv.env['OPENAI_ORGANIZATION'] ?? '';
  static String idProject = dotenv.env['OPENAI_PROJECT_ID'] ?? '';
  static const String baseUrl = "https://api.openai.com/v1/chat/completions";
}
