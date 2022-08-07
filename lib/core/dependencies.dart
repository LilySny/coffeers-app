import 'package:coffers_app/modules/recipes/data/services/recipes_service.dart';
import 'package:coffers_app/modules/recipes/data/services/recipes_service_impl.dart';
import 'package:coffers_app/modules/recipes/view/controllers/recipes_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerSingleton<RecipesService>(RecipesServiceImpl(Dio()));
  
  GetIt.I.registerSingleton<RecipesCubit>(
      RecipesCubit(service: GetIt.I<RecipesService>()));
}
