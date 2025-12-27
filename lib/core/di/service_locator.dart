import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/image_repository.dart';
import '../../logic/bloc/image_bloc.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // External
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Repositories
  getIt.registerLazySingleton<ImageRepository>(
    () => ImageRepository(dio: getIt()),
  );

  // Blocs
  getIt.registerFactory<ImageBloc>(() => ImageBloc(repository: getIt()));
}
