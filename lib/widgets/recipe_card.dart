import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget{
  final String label;
  final String imageUrl;
  final String description;

  const RecipeCard({
    super.key,
    required this.label,
    required this.imageUrl,
    required this.description
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          margin: const EdgeInsets.only(top: 5),
          // height: MediaQuery.of(context).size.width * 0.1,
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Image.network(
                    imageUrl,
                    // width: MediaQuery.of(context).size.width * 0.1,
                    // height: 300,
                    // scale:1,
                ),
                title: Text(label),
                subtitle: Text(description),
              )
            ],
          ),
        ),
      ),
    );
  }
}