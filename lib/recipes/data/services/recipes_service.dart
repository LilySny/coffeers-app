import 'package:coffers_app/recipes/data/models/recipe.dart';

abstract class RecipesService {
  Future<List<Recipe>>? findAll();
}