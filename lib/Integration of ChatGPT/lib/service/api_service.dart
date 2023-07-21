import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/question_model.dart';

class OpenAiService {
  final String _apiKey;
  static const String _baseUrl = 'https://api.openai.com/v1/completions';

  OpenAiService(this._apiKey);

  Future<Answer> getAnswer(String question) async {
    final headers = {
      'Authorization': 'Bearer $_apiKey',
      'Content-Type': 'application/json',
    };
    final questionData = Question(text: question);
    final body = jsonEncode(
      {
        'model': "text-davinci-003",
        'prompt': questionData.text,
        'max_tokens': 700,
        'temperature': 0
      },
    );
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        final jsonresponse = jsonDecode(response.body);
        final result = jsonresponse['choices'][0]['text'];
        return Answer(text: result);
      } else {
        throw Exception('Failed to get an answer from the OpenAI API');
      }
    } catch (e) {
      throw Exception('Failed to get an answer from the OpenAI API');
    }
  }
}
