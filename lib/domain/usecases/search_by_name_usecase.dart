import 'package:flutter/material.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/domain/entities/superhero.dart';
import 'package:rd_app/domain/repositories/superheroes_service.dart';

class SearchByNameUsecase {
  final SuperheroesService superheroesService;

  SearchByNameUsecase(this.superheroesService);

  Future<List<SuperheroModel>> call(
      {@required List<Superhero> items,
      @required String name,
      @required String gender}) async {
    return Future.value(superheroesService.filterByName(
        items: items, name: name, gender: gender));
  }

}
