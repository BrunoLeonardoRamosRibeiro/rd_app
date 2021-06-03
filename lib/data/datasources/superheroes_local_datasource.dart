import 'package:flutter/material.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'dart:math';

abstract class SuperheroesLocalDatasource {
  Future<List<SuperheroModel>> filterByName(
      {@required List<SuperheroModel> items,
      @required String name,
      @required String gender});

  Future<SuperheroModel> randomSuperhero(
      {@required List<SuperheroModel> items});
}

class SuperheroesLocalDatasourceImpl implements SuperheroesLocalDatasource {
  @override
  Future<List<SuperheroModel>> filterByName(
      {@required List<SuperheroModel> items,
      @required String name,
      @required String gender}) {
    if (name.trim().length == 0) {
      List<SuperheroModel> newItemsByGender = items.where((element) {
        var result =
            element.appearance.gender.toUpperCase() == gender.toUpperCase();
        return result;
      }).toList();
      return Future.value(newItemsByGender);
    } else {
      List<SuperheroModel> newItemsByGender = items.where((element) {
        var result =
            element.appearance.gender.toUpperCase() == gender.toUpperCase();
        return result;
      }).toList();

      List<SuperheroModel> newItems = newItemsByGender.where((element) {
        var result = element.name.toUpperCase();
        return result.contains(name.toUpperCase());
      }).toList();

      return Future.value(newItems);
    }
  }

  @override
  Future<SuperheroModel> randomSuperhero(
      {@required List<SuperheroModel> items}) async {
    var random = new Random();

    var randomItem = random.nextInt(items.length);

    return Future.value(items[randomItem]);
  }
}
