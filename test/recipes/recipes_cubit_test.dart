import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:coffers_app/src/modules/recipes/data/models/recipe.dart';
import 'package:coffers_app/src/modules/recipes/data/services/recipes_service.dart';
import 'package:coffers_app/src/modules/recipes/view/controllers/recipes_cubit.dart';
import 'package:coffers_app/src/modules/recipes/view/controllers/recipes_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/recipes_mock.dart';
import '../mocks/recipes_service_mock.dart';

void main() {
  late final RecipesService? recipesServiceMock;
  late final RecipesCubit? cubit;

  final data = json.decode(recipesMock)["items"] as List;
  final List<Recipe> result = data.map((e) => Recipe.fromJson(e)).toList();

  setUpAll(() {
    recipesServiceMock = RecipesServiceMock();
    cubit = RecipesCubit(service: recipesServiceMock!);
  });

  tearDown(() {
    cubit!.close();
  });

  group('getCoffeeRecipes()', () {
    final Exception tException = Exception('Failed to fetch recipes.');

    blocTest<RecipesCubit, RecipesState>(
      'emits [LoadingState, LoadedState] when '
      'getCoffeeRecipes() is called successfully.',
      setUp: () =>
          when(recipesServiceMock!.findAll()).thenAnswer((_) async => result),
      build: () => cubit!,
      act: (cubit) => cubit.getCoffeeRecipes(),
      expect: () => <RecipesState>[
        LoadingState(),
        LoadedState(result),
      ],
    );

    blocTest<RecipesCubit, RecipesState>(
      'emits [LoadingState, ErrorState] when '
      'getCoffeeRecipes() failed.',
      setUp: () => when(recipesServiceMock!.findAll()).thenThrow(tException),
      build: () => cubit!,
      act: (cubit) => cubit.getCoffeeRecipes(),
      expect: () => <RecipesState>[
        LoadingState(),
        ErrorState(),
      ],
    );
  });
}
