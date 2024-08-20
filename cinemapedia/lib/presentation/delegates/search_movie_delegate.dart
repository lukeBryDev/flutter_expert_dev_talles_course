import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallBack = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallBack searchMovies;
  List<Movie> initialMovies;

  StreamController<List<Movie>> debouncedMoviesStream =
      StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate(
      {required this.searchMovies, required this.initialMovies});

  void _onQueryChanged(String query) {
    if (query.isNotEmpty) isLoadingStream.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final movies = await searchMovies(query);
      isLoadingStream.add(false);
      initialMovies = movies;
      debouncedMoviesStream.add(movies);
    });
  }

  void _clearStreams() {
    debouncedMoviesStream.close();
  }

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder<bool>(
          stream: isLoadingStream.stream,
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return SpinPerfect(
                spins: 10,
                infinite: true,
                child: IconButton(
                  onPressed: () {
                    query = '';
                    _onQueryChanged(query);
                  },
                  icon: const Icon(Icons.refresh_rounded),
                ),
              );
            } else {
              return FadeIn(
                animate: query.isNotEmpty,
                child: IconButton(
                  onPressed: () {
                    query = '';
                    _onQueryChanged(query);
                  },
                  icon: const Icon(Icons.clear),
                ),
              );
            }
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        _clearStreams();
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildResultSuggestions();
  }

  StreamBuilder<List<Movie>> _buildResultSuggestions() {
    return StreamBuilder(
        initialData: initialMovies,
        stream: debouncedMoviesStream.stream,
        builder: (context, snapshot) {
          final movies = snapshot.data ?? [];
          return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return _MovieItem(
                  movie: movie,
                  onMovieSelected: (context, movie) {
                    _clearStreams();
                    close(context, movie);
                  },
                );
              });
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return _buildResultSuggestions();
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function(BuildContext, Movie) onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            // Image
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            // Description
            const SizedBox(width: 10),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyles.titleMedium),
                  if (movie.overview.length > 100)
                    Text('${movie.overview.substring(0, 100)}...')
                  else
                    Text(movie.overview),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow.shade800,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: textStyles.bodyMedium!
                            .copyWith(color: Colors.yellow.shade800),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
