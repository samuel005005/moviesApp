import 'package:moviesapp/src/domain/datasources/actors_datasource.dart';
import 'package:moviesapp/src/domain/entities/actor.dart';
import 'package:moviesapp/src/domain/repositories/actors_repository.dart';

class ActorsRepositoryImplementation extends ActorsRepository {
  final ActorsDataSource actorsDataSource;

  ActorsRepositoryImplementation(this.actorsDataSource);
  @override
  Future<List<Actor>> getActorsByMovie(String id) {
    return actorsDataSource.getActorsByMovie(id);
  }
}
