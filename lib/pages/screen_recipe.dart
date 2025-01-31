import 'package:flutter/material.dart';
import 'package:recipes/moldels/model_recipe.dart';
import 'package:recipes/pages/daitls_page.dart';
import 'package:recipes/services/api_recipe.dart';

class screenrecipe extends StatefulWidget {
  const screenrecipe({super.key});

  @override
  State<screenrecipe> createState() => _screenrecipeState();
}

class _screenrecipeState extends State<screenrecipe> {
  final ApiRecipe apiRecipe = ApiRecipe();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('food Recipe'),
        ),
        body: FutureBuilder <List<Modleracipe>>(
          future: apiRecipe.getrecipe(),

          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('Error${snapshot.error}');
              } else if (snapshot.hasData) {
                final List<Modleracipe> recipes = snapshot.data!;
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) {
                          return DaitlsPage(recipeId:snapshot.data![index].id,);
                        },));
                      },
                      child: ListTile(
                        title: Text(recipes[index].name),
                        subtitle: Text(recipes[index].description),
                        leading: Image.network(recipes[index].imageurl),
                      ),
                    );
                  }
                );
              }else {
                return Text('لاتوجد بيانات ');
              }
            }return SizedBox.shrink();
          },
        ));
  }
}
