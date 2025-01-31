import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipes/moldels/model_recipe.dart';
import 'package:recipes/moldels/recipedaitls.dart';

class ApiRecipe {
  final String baseurl = 'http://localhost:3000/';


 
  Future<List<Modleracipe>> getrecipe() async {
    final response = await http.get(Uri.parse(baseurl + 'recipes'));
    if (response.statusCode == 200) {
      
      List data = jsonDecode(response.body);
      List<Modleracipe> recipes=[];
      for(int i =0 ; i < data.length ; i++){
        recipes.add(Modleracipe.fromJson(data[i]));
      }

    return recipes;
    } else {
      throw Exception('حدث خطا ما ');
    }
  }
  Future<Recipedaitls> getRecipedaitls (String RecipeId) async {
 
  final respons = await http.get(Uri.parse(baseurl + 'recipes/$RecipeId'));
  if (respons.statusCode == 200) {
    final datas = jsonDecode(respons.body);
    return Recipedaitls.fromJson(datas);
  } else {
    throw Exception('حدث خطا ما ');
  }
}
}


