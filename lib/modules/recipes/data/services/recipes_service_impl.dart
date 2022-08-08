import 'package:coffers_app/modules/recipes/data/models/recipe.dart';
import 'package:coffers_app/modules/recipes/data/services/recipes_service.dart';
import 'package:coffers_app/shared/constants.dart';
import 'package:dio/dio.dart';

class RecipesServiceImpl implements RecipesService {
  final Dio _dio;

  RecipesServiceImpl(this._dio);

  @override
  Future<List<Recipe>>? findAll() async {
    try {
      final response = await _dio.get('$baseUrl/items');

      return List<Recipe>.from(
         response.data.map((x) => Recipe.fromJson(x))).toList();
    } on DioError catch (_) {
      throw DioError(
        requestOptions: RequestOptions(path: '$baseUrl/items'),
      );
    } catch (e) {
      throw Exception("Error occured getting all recipes.");
    }
  }
  
}
