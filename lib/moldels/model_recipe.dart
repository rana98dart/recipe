import 'package:flutter/foundation.dart';

class Modleracipe {
  final String name;
final String description;
final String imageurl;
final String id ;
  const Modleracipe ({required this.name, 
  required this.description, required this.imageurl,required this.id});

factory Modleracipe.fromJson(Map<String,dynamic> Json){
  return Modleracipe(name: Json['name'],
   description: Json['description'], 
   imageurl: Json['image'],
   id: Json['id']);
}

}
