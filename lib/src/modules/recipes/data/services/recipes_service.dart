import 'package:coffers_app/src/modules/recipes/data/models/recipe.dart';

abstract class RecipesService {
  Future<List<Recipe>>? findAll();
}