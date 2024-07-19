import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';
import 'package:mini_hackathon_three/api/movie/movie_service.dart';

final GetIt app = GetIt.instance;

void setup() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  // For testing purposes
  app.allowReassignment = true;

  app.registerFactory<MovieService>(MovieService.new);
}
