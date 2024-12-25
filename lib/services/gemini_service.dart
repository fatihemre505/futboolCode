import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  late final GenerativeModel _model;

  GeminiService() {
    final apiKey = dotenv.env['AIzaSyBBN9UryEZcxs45DTCPMsUkzwCQRJWzOgk']!;
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
    );
  }

  Future<String> getPrediction(String homeTeam, String awayTeam) async {
    try {
      final prompt = '''
        Analyze and predict the football match between $homeTeam and $awayTeam.
        Consider recent form, head-to-head statistics, and current team conditions.
        Provide:
        1. Predicted score
        2. Win probability
        3. Key factors affecting the prediction
        ''';

      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      return response.text ?? 'Unable to generate prediction';
    } catch (e) {
      throw Exception('Failed to get prediction: $e');
    }
  }
}