import 'package:coffers_app/src/modules/recipes/data/models/recipe.dart';
import 'package:coffers_app/src/modules/recipes/data/services/recipes_service.dart';
import 'package:coffers_app/src/shared/constants.dart';
import 'package:dio/dio.dart';

class RecipesServiceImpl implements RecipesService {
  final Dio _dio;

  RecipesServiceImpl(this._dio);

  @override
  Future<List<Recipe>>? findAll() async {
    try {
      final response = await _dio.get('$baseUrl/b/62f07044e13e6063dc705b2b');

      return List<Recipe>.from(
         response.data["record"]["items"].map((x) => Recipe.fromJson(x))).toList();
    } on DioError catch (_) {
      throw DioError(
        requestOptions: RequestOptions(path: '$baseUrl/items'),
      );
    } catch (e) {
      throw Exception("Error occured getting all recipes.");
    }
  }
  
}
