import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mini_hackathon_three/api/movie/data/chat_gpt_service.dart';
import 'package:mini_hackathon_three/api/movie/data/movie.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail.dart';

// movie id = tt3896198
class MovieService implements MovieGptService {
  Future<Movie> getMovie({required String id}) {
    Uri url = Uri.https('www.omdbapi.com', '', {'i': id, 'apikey': 'b7c0cdea'});
    return http.get(url).then(
        (http.Response response) => Movie.fromJson(jsonDecode(response.body)));
  }

  Future<MovieDetail> fetchPopularMovies(int? page) async {
    final apiKey = dotenv.env['TMBD_API_TOKEN'];
    final uri = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '/3/movie/popular',
      queryParameters: {
        'api_key': apiKey,
        'page': page?.toString(),
      },
    );
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MovieDetail.fromJson(data);
    } else {
      throw Exception('Filme konnten nicht geladen werden');
    }
  }

  @override
  Future<String> getQouteFromMovie(String movieTitle) async {
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
