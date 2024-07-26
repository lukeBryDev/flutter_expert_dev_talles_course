import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastucture/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infrastucture/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: movieDb.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieDb.backdropPath}'
          : 'https://ih1.redbubble.net/image.5055723050.4010/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
      genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: movieDb.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
          : 'no-poster',
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount);

  static Movie movieDetailToEntity(MovieDetails movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: movieDb.backdropPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieDb.backdropPath}'
          : 'https://ih1.redbubble.net/image.5055723050.4010/flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
      genreIds: movieDb.genres.map((e) => e.name.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath: movieDb.posterPath != ''
          ? 'https://image.tmdb.org/t/p/w500/${movieDb.posterPath}'
          : 'no-poster',
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount);
}
