import 'package:moviesapp/src/app/core/usescases/usecase_with_argument.dart';
import 'package:moviesapp/src/domain/entities/movie.dart';
import 'package:moviesapp/src/domain/repositories/movies_repository.dart';

class GetNowPlayingMoviesUseCase
    extends UseCaseWithArguments<List<Movie>, int> {
  final MoviesRepository _moviesRepository;

  GetNowPlayingMoviesUseCase({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<Movie>> execute(int arguments) async {
    return await _moviesRepository.getNowPlaying();
  }
}
