import 'package:coffers_app/src/shared/colors.dart';
import 'package:flutter/material.dart';

class RecipeStepItemsWidget extends StatelessWidget {
  const RecipeStepItemsWidget({
    Key? key,
    required this.label,
    required this.list,
  }) : super(key: key);

  final String label;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: lightBrown,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list
              .map((e) => Text(
                    "• $e\n",
                    style: const TextStyle(
                      color: secondaryLightBrown,
                      fontSize: 18.0,
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
