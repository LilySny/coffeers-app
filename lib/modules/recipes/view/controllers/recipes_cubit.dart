import 'package:coffers_app/modules/recipes/data/services/recipes_service.dart';
import 'package:coffers_app/modules/recipes/view/controllers/recipes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit({required this.service}) : super(InitialState()) {
    getCoffeeRecipes();
  }
  
  final RecipesService service;

  void getCoffeeRecipes() async {
  try {
    emit(LoadingState());
    final items = await service.findAll();
    emit(LoadedState(items));
  } catch (e) {
    emit(ErrorState());
  }
}
}