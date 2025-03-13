import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigDeepseek {
  static String apiKey = dotenv.env['DEEPSEEK_API_KEY'] ?? '';
  static const String baseUrl = "https://api.deepseek.com/v1/generate_routine";
}
