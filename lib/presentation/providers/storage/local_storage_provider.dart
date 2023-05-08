import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesapp/infrastructure/datasources/isar_storage/local_storage_datasource.dart';
import 'package:moviesapp/infrastructure/repositories/local_storage_repository_implementation.dart';

final isFavoriteProvider =
    FutureProvider.family.autoDispose((ref, int movieId) {
  final localStorageRepository = ref.watch(localStorageProvider);
  return localStorageRepository.isMovieFavorite(movieId);
});

final localStorageProvider = Provider((ref) {
  return LocalStorageRepositoryImplementation(StorageDataSource());
});
