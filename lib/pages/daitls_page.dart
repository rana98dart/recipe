import 'package:flutter/material.dart';
import 'package:recipes/services/api_recipe.dart';

class DaitlsPage extends StatefulWidget {
  const DaitlsPage({required this.recipeId,super.key});
final String recipeId;

  @override
  State<DaitlsPage> createState() => _DaitlsPageState();
}

class _DaitlsPageState extends State<DaitlsPage> {
  
  ApiRecipe apiRecipe = ApiRecipe();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: apiRecipe.getRecipedaitls(widget.recipeId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              } else if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Image.network(snapshot.data!.imageurl),
                  SizedBox(height: 20,),
                


                ],);
              }
            }
            return SizedBox.shrink();
          }),
    );
  }
}

