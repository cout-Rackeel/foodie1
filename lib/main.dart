import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie1/recipe.dart';
import 'package:foodie1/widgets/recipe_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child:
        FutureBuilder<List<Recipe>>(
          future: getAllRecipes2(),
          builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting ?
          Center(child: const CircularProgressIndicator()) : ListView.builder(
              itemCount: Recipe.sampleRecipes2.length,
              itemBuilder: (BuildContext context, int index) {
                return RecipeCard(
                    label: Recipe.sampleRecipes2[index].label,
                    imageUrl: Recipe.sampleRecipes2[index].imageUrl,
                    description: Recipe.sampleRecipes2[index].description
                );
                // return procDetailPage(context, index);
              }
          ),
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      child: Column(
        children: <Widget>[
          Image(image: AssetImage(recipe.imageUrl)),
          Text(recipe.label),
        ],
      ),
    );
  }

  Widget procDetailPage(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return const Text('Recipe Details Page');
              }
              )
          );
        }
    );
  }

  Future<void> getAllRecipes() async {
    var response = await http.get(
        Uri.parse('https://amberclass.fimijm.com/api/v1/recipes'));
    var responseData = json.decode(response.body);
    (responseData['data']['recipes'] as List<Map<String, String>>).forEach(
            (element) {
          Recipe.sampleRecipes2.add(
              Recipe(
                  element['title']!,
                  element['image']!,
                  element['description']!)
          );
        }
    );
  }
  Future<List<Recipe>> getAllRecipes2() async {
    var response = await http.get(
        Uri.parse('https://amberclass.fimijm.com/api/v1/recipes'));
    var responseData = jsonDecode(response.body);
    print(responseData);
      // return (responseData['data']['recipes'] as List<Map<String,String>>).map(
      //         (element) {
      //           return Recipe(
      //               element['title']!,
      //               element['image']!,
      //               element['description']!);
      //
      //     }
      // ).toList();
    }
  }

  List<Recipe> createRecipeList(List data) {
      List<Recipe> list = [];
      for (int i = 0; i <= data.length; i++) {
        String title = data[i]['title'];
        String image = data[i]['image'];
        String description = data[i]['description'];
        Recipe recipe = new Recipe(title:title, image:image, description:description);
        list.add(recipe);
      }
      return list;
    }

  class Recipe{
      final String title;
      final String image;
      final String description;

      Recipe({required this.title, required this.image, required this.description});
  }
