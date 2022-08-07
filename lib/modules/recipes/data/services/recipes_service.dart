import 'package:coffers_app/modules/recipes/data/models/recipe.dart';

abstract class RecipesService {
  Future<List<Recipe>>? findAll();
}