import 'package:flutter/cupertino.dart';
import '../models/image_model.dart';
import '../models/ingredient_model.dart';
import '../models/nutrition_model.dart';
import '../models/steps_model.dart';

class Recipe with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String? rating;
  final String numOfRatings;
  final String time;
  final String category;
  final List<ImageModel> images;
  final List<Ingredient> ingredients;
  final List<Nutrition> nutritions;
  final List<Step> steps;

  Recipe(
      this.id,
      this.name,
      this.description,
      this.rating,
      this.numOfRatings,
      this.time,
      this.category,
      this.images,
      this.ingredients,
      this.nutritions,
      this.steps);

  Recipe.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['recipeName'] as String,
        description = json['recipeDescription'] as String,
        rating =
            json['recipeRating'] == null ? "0" : json['recipeRating'] as String,
        numOfRatings =
            json['numOfRatings'] == null ? "0" : json['numOfRatings'] as String,
        time = json['totalTime'] == null
            ? "0"
            : json['totalTime'].replaceAll(RegExp('[^0-9]'), '') as String,
        category = json['recipeMainCategory'] as String,
        images = (json['images'] as List<dynamic>)
            .map((image) => ImageModel.fromJson(image as Map<String, dynamic>))
            .toList(),
        ingredients = (json['ingredients'] as List<dynamic>)
            .map((ingredient) =>
                Ingredient.fromJson(ingredient as Map<String, dynamic>))
            .toList(),
        nutritions = (json['nutritions'] as List<dynamic>)
            .map((nutrition) =>
                Nutrition.fromJson(nutrition as Map<String, dynamic>))
            .toList(),
        steps = (json['directions'] as List<dynamic>)
            .map((step) => Step.fromJson(step as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'recipeName': name,
        'recipeDescription': description,
        'recipeRating': rating,
        'numOfRatings': numOfRatings,
        'totlatime': 'PT${time}M',
        'recipeMainCategory': category,
        'images': images,
        'ingredients': ingredients,
        'nutritions': nutritions,
        'directions': steps,
      };
}
