import 'package:flutter_dotenv/flutter_dotenv.dart';

class CopilotConfig {
  static String apiKey = dotenv.env['COPILOT_API_KEY'] ?? '';
  static const String baseUrl = "https://api.copilot.com/";
}
