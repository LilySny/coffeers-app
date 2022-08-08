import 'package:coffers_app/modules/recipes/view/widgets/recipe_list_widget.dart';
import 'package:coffers_app/shared/colors.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBrown,
      appBar: AppBar(
        backgroundColor: primaryDarkBrown,
        title: const Text("Receitas", style: TextStyle(color: lightBrown),),
      ),
      body: const RecipeListWidget(),
    );
  }

}