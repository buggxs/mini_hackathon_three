import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;
import 'package:mini_hackathon_three/api/movie/chat_gpt_service.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail_page.dart';

// movie id = tt3896198
class MovieService implements MovieGptService {
  final tmbdToken = dotenv.env['TMBD_API_TOKEN'];
  final openAiKey = dotenv.env['OPENAI_API_KEY'];
  final geminiAiKey = dotenv.env['GEMINI_API_KEY'];

  Future<List<MovieDetailPage>> getPopularMovies({required int pages}) async {
    final List<MovieDetailPage> movieDetailPages = [];
    for (int i = 0; i < pages; i++) {
      movieDetailPages.add(await fetchPopularMovieByPage(i + 1));
    }
    return movieDetailPages;
  }

  Future<MovieDetailPage> fetchPopularMovieByPage(int page) async {
    final url = 'https://api.themoviedb.org/3/movie/popular?page=$page';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        "accept": "application/json",
        "Authorization": "Bearer $tmbdToken",
      },
    );

    if (response.statusCode == 200) {
      return MovieDetailPage.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw Exception('Filme konnten nicht geladen werden');
    }
  }

  @override
  Future<String> getQuoteFromMovie(String movieTitle) async {
    final response = await http.post(
        Uri.parse(
            'https://api.openai.com/v1/engines/davinci-codex/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAiKey',
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

  Future<String?> geminiQuotes(String movieTitle) async {
    final GenerativeModel model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: geminiAiKey ?? '',
    );
    final content = [
      Content.text(
          'Generiere ein Zitat aus dem Film $movieTitle. Ohne den Film in der Antwort zu erwähnen.')
    ];
    final response = await model.generateContent(content);
    return response.text;
  }
}
