import 'package:moviesapp/domain/entities/movie.dart';
import 'package:moviesapp/infrastructure/models/models.dart';

class MovieMapper {
  static const String _posterNotFound =
      'https://sd.keepcalms.com/i/keep-calm-poster-not-found.png';

  static Movie movieDbToEntity(MovieMovieDB movieDB) => Movie(
        adult: movieDB.adult,
        backdropPath: movieDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movieDB.backdropPath}'
            : _posterNotFound,
        genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
        id: movieDB.id,
        originalLanguage: movieDB.originalLanguage,
        originalTitle: movieDB.originalTitle,
        overview: movieDB.overview,
        popularity: movieDB.popularity,
        posterPath: movieDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movieDB.posterPath}'
            : 'no-poster',
        releaseDate: movieDB.releaseDate,
        title: movieDB.title,
        video: movieDB.video,
        voteAverage: movieDB.voteAverage,
        voteCount: movieDB.voteCount,
      );

  static Movie movieDetailDbToEntity(MovieDetailDB movieDetailDB) => Movie(
        adult: movieDetailDB.adult,
        backdropPath: movieDetailDB.backdropPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movieDetailDB.backdropPath}'
            : _posterNotFound,
        genreIds: movieDetailDB.genres.map((e) => e.name.toString()).toList(),
        id: movieDetailDB.id,
        originalLanguage: movieDetailDB.originalLanguage,
        originalTitle: movieDetailDB.originalTitle,
        overview: movieDetailDB.overview,
        popularity: movieDetailDB.popularity,
        posterPath: movieDetailDB.posterPath != ''
            ? 'https://image.tmdb.org/t/p/w500/${movieDetailDB.posterPath}'
            : 'no-poster',
        releaseDate: movieDetailDB.releaseDate,
        title: movieDetailDB.title,
        video: movieDetailDB.video,
        voteAverage: movieDetailDB.voteAverage,
        voteCount: movieDetailDB.voteCount,
      );
}
