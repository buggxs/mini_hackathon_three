import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mini_hackathon_three/api/movie/data/movie.dart';
import 'package:mini_hackathon_three/api/movie/data/movie_detail_page.dart';

// movie id = tt3896198
class MovieService {
  Future<Movie> getMovie({required String id}) {
    Uri url = Uri.https('www.omdbapi.com', '', {'i': id, 'apikey': 'b7c0cdea'});
    return http.get(url).then(
        (http.Response response) => Movie.fromJson(jsonDecode(response.body)));
  }

  Future<MovieDetailPage> fetchPopularMovies({int page = 1}) async {
    final apiKey = dotenv.env['TMBD_API_TOKEN'];
    final uri = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '/3/movie/popular',
      queryParameters: {
        'page': '$page',
      },
    );
    final response =
        await http.get(uri, headers: {'Authorization': 'Bearer $apiKey'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MovieDetailPage.fromJson(data);
    } else {
      throw Exception('Filme konnten nicht geladen werden');
    }
  }
}
