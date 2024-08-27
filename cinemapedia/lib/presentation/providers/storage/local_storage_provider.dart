import 'package:cinemapedia/infrastucture/datasources/isar_data_source.dart';
import 'package:cinemapedia/infrastucture/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDataSource());
});
