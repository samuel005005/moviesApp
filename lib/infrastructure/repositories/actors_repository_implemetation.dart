import 'package:moviesapp/domain/datasources/actors_datasource.dart';
import 'package:moviesapp/domain/entities/actor.dart';
import 'package:moviesapp/domain/repositories/actors_repository.dart';

class ActorsRepositoryImplementation extends ActorsRepository {
  final ActorsDataSource actorsDataSource;

  ActorsRepositoryImplementation(this.actorsDataSource);
  @override
  Future<List<Actor>> getActorsByMovie(String id) {
    return actorsDataSource.getActorsByMovie(id);
  }
}
