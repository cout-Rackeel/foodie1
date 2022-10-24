import 'package:flutter/material.dart';
import 'package:foodie1/recipe.dart';

class RecipeDetailsPage extends StatefulWidget{
  const RecipeDetailsPage({super.key, required this.title});
  final String title;
  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPage();
}

class _RecipeDetailsPage extends State<RecipeDetailsPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Recipe Details Page")),
    );
  }
}