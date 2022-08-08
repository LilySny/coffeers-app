import 'dart:convert';

import 'package:coffers_app/src/modules/recipes/data/models/recipe.dart';
import 'package:coffers_app/src/modules/recipes/data/services/recipes_service.dart';
import 'package:coffers_app/src/modules/recipes/data/services/recipes_service_impl.dart';
import 'package:coffers_app/src/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../mocks/recipes_mock.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late RecipesService service;
  const path = '$baseUrl/b/62f07044e13e6063dc705b2b';

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);
    service = RecipesServiceImpl(dio);
  });

  tearDown(() {
    dio.close();
  });

  group('recipes service tests', () {
    test(
      'should get recipes if status is 200',
      () async {
        dioAdapter.onGet(
          path,
          (server) => server.reply(
            200,
            recipesMock,
            delay: const Duration(seconds: 1),
          ),
        );

        final response = await dio.get(path);

        final data = json.decode(response.data)["items"] as List;
        final List<Recipe> list = data.map((e) => Recipe.fromJson(e)).toList();

        expect(list.first.title, contains('ingredientes'));
      },
    );

    test(
      'should throw error if status is different from 200',
      () async {
        dioAdapter.onGet(
          path,
          (server) => server.throws(
            500,
            DioError(requestOptions: RequestOptions(path: path)),
            delay: const Duration(seconds: 1),
          ),  
        );

        final response = service.findAll();

        await expectLater(response, throwsA((e) => e is DioError));
      },
    );
  });
}