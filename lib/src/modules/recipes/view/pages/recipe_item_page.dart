import 'package:coffers_app/src/modules/recipes/data/models/recipe.dart';
import 'package:coffers_app/src/modules/recipes/view/widgets/recipe_step_items_widget.dart';
import 'package:coffers_app/src/shared/colors.dart';
import 'package:flutter/material.dart';

class RecipeItemPage extends StatelessWidget {
  const RecipeItemPage({Key? key, required this.item}) : super(key: key);

  final Recipe item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBrown,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _recipeImage(context),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: _pageContent(),
            ),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: lightBrown, fontSize: 26.0),
        ),
        const SizedBox(
          height: 50.0,
        ),
        RecipeStepItemsWidget(label: "Ingredientes", list: item.ingredients),
        const SizedBox(
          height: 30.0,
        ),
        RecipeStepItemsWidget(label: "Modo de preparo", list: item.steps),
      ],
    );
  }

  Widget _recipeImage(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(35.0),
            bottomRight: Radius.circular(35.0)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(item.imageUrl),
        ),
      ),
    );
  }
}
