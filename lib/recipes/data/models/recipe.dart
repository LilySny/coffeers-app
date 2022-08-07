class Recipe {
  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.steps,
    required this.imageUrl,
  });

  int id;
  String title;
  List<String> ingredients;
  List<String> steps;
  String imageUrl;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        title: json["title"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        steps: List<String>.from(json["steps"].map((x) => x)),
        imageUrl: json["imageUrl"],
      );

}
