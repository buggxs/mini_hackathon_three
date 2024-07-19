import 'package:get_it/get_it.dart';
import 'package:mini_hackathon_three/api/movie/movie_service.dart';

final GetIt app = GetIt.instance;

void setup() {
  // For testing purposes
  app.allowReassignment = true;

  app.registerFactory<MovieService>(MovieService.new);
}
