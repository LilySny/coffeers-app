import 'package:coffers_app/modules/recipes/data/models/recipe.dart';
import 'package:equatable/equatable.dart';

abstract class RecipesState extends Equatable {}

class InitialState extends RecipesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends RecipesState {
  @override
  List<Object> get props => [];
}

class LoadedState extends RecipesState {
  LoadedState(this.items);

  final List<Recipe>? items;

  @override
  List<Object> get props => [items!];
}

class ErrorState extends RecipesState {
  @override
  List<Object> get props => [];
}
