import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/src/infrastructure/datasources/movieDb/actors_datasource.dart';
import 'package:moviesapp/src/infrastructure/repositories/actors_repository_implemetation.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImplementation(ActorDataSource());
});
