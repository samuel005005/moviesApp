import 'package:dio/dio.dart';

import 'package:moviesapp/src/app/config/constants/environament.dart';
import 'package:moviesapp/src/domain/datasources/actors_datasource.dart';
import 'package:moviesapp/src/domain/entities/actor.dart';
import 'package:moviesapp/src/infrastructure/mappers/credit_mapper.dart';
import 'package:moviesapp/src/infrastructure/models/moviedb/credits/credits_response.dart';

class ActorDataSource extends ActorsDataSource {
  final dio = Dio(
    BaseOptions(
      baseUrl: Enviroment.movieDbUrl,
      queryParameters: {
        'api_key': Enviroment.movieDbKey,
        'language': Enviroment.movieDbLan,
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String id) async {
    final response = await dio.get('/movie/$id/credits');
    if (response.statusCode != 200) {
      throw Exception('Credits with movie Id: $id not found');
    }

    final actorsResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = actorsResponse.cast
        .map((actor) => ActorMapper.actorDbToEntity(actor))
        .toList();

    return actors;
  }
}
