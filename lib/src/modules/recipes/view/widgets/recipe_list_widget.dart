import 'package:coffers_app/src/core/dependencies.dart';
import 'package:coffers_app/src/modules/recipes/data/models/recipe.dart';
import 'package:coffers_app/src/modules/recipes/view/controllers/recipes_cubit.dart';
import 'package:coffers_app/src/modules/recipes/view/controllers/recipes_state.dart';
import 'package:coffers_app/src/modules/recipes/view/widgets/recipe_item_widget.dart';
import 'package:coffers_app/src/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeListWidget extends StatefulWidget {
  const RecipeListWidget({Key? key}) : super(key: key);

  @override
  State<RecipeListWidget> createState() => _RecipeListWidgetState();
}

class _RecipeListWidgetState extends State<RecipeListWidget> {
  late final RecipesCubit _recipesCubit;

  @override
  void initState() {
    _recipesCubit = getIt<RecipesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesState>(
      bloc: _recipesCubit,
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(lightBrown)),
          );
        } else if (state is ErrorState) {
          return const Center(
            child: Text("Erro ao carregar os dados"),
          );
        } else if (state is LoadedState) {
          return itemsGrid(state.items);
        } else {
          return Container();
        }
      },
    );
  }

  Widget itemsGrid(List<Recipe>? items) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 7.0),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.9 / 2,
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 7,
      ),
      itemCount: items?.length,
      itemBuilder: (BuildContext context, int index) {
        return RecipeItemWidget(
          item: items![index],
        );
      },
    );
  }
}
