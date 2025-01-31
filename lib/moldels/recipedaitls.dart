class Recipedaitls {
  final String name;
  final String description;
  final List ingredients;
  final List instractions;
  final int prepTime;
  final Map<String, dynamic> nutrition;
  final String imageurl;
  const Recipedaitls(
      {required this.name,
      required this.description,
      required this.ingredients,
      required this.instractions,
      required this.prepTime,
      required this.nutrition,
      required this.imageurl});
  factory Recipedaitls.fromJson(Map<String, dynamic> Json) {
    return Recipedaitls(
        name: Json['name'],
        description: Json['description'],
        ingredients: Json['ingredients'],
        instractions: Json['instructions'],
        prepTime: Json['prepTime'],
        nutrition: Json['nutrition'],
        imageurl: Json['image']);
  }
}
