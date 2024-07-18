import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mini_hackathon_three/api/movie/data/movie.dart';

abstract class MovieService {
  Future<Movie> getMovie({required String id});
}

// movie id = tt3896198
class OnlineMovieService implements MovieService {
  @override
  Future<Movie> getMovie({required String id}) {
    Uri url = Uri.https('www.omdbapi.com', '', {'i': id, 'apikey': 'b7c0cdea'});
    return http
        .get(url)
        .then((Response response) => Movie.fromJson(jsonDecode(response.body)));
  }
}
