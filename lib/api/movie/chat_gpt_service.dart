import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class MovieGptService {
  Future<String> getQuoteFromMovie(String movieTitle);
}

class ChatGptService implements MovieGptService {
  @override
  Future<String> getQuoteFromMovie(String movieTitle) async {
    final apikey = dotenv.env['OPENAI_API_KEY'];
    final response = await http.post(
        Uri.parse(
            'https://api.openai.com/v1/engines/davinci-codex/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apikey',
        },
        body: json.encode({
          'prompt': 'Generiere ein Zitat aus dem Film $movieTitle',
          'max_tokens': 50,
        }));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['choices'][0]['text'];
    } else {
      return 'Failed to load quote';
    }
  }
}
