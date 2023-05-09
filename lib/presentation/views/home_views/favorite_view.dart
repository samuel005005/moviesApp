import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/domain/entities/movie.dart';
import 'package:moviesapp/presentation/providers/providers.dart';

class FavoriteView extends ConsumerStatefulWidget {
  const FavoriteView({super.key});

  @override
  FavoriteViewState createState() => FavoriteViewState();
}

class FavoriteViewState extends ConsumerState<FavoriteView> {
  @override
  void initState() {
    super.initState();
    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final Map<int, Movie> movies = ref.watch(favoriteMoviesProvider);
    print(movies);
    return Scaffold(body: ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Hola'),
        );
      },
    ));
  }
}
