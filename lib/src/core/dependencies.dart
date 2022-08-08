import 'package:coffers_app/src/modules/recipes/data/services/recipes_service.dart';
import 'package:coffers_app/src/modules/recipes/data/services/recipes_service_impl.dart';
import 'package:coffers_app/src/modules/recipes/view/controllers/recipes_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<RecipesService>(() => RecipesServiceImpl(Dio()));

  getIt.registerLazySingleton<RecipesCubit>(
      () => RecipesCubit(service: GetIt.I<RecipesService>()));
}
