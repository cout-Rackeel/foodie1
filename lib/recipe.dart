
class Recipe{
  String label;
  String imageUrl;
  String description;

  Recipe(
  this.label,
  this.imageUrl,
  this.description,
);

  static List<Recipe> sampleRecipes = [
    Recipe("Mackerel Rundung", "images/mackerel-rundung.jpeg", "Coconut milk & Mackerel"),
    Recipe("Cornbeef & Rice", "images/cornbeef.jpeg", "Coconut milk & Mackerel")
  ];

  static List<Recipe> sampleRecipes2 = [];

}