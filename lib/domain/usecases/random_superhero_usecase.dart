import 'package:flutter/material.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/domain/repositories/superheroes_service.dart';

class RandomSuperheroUsecase {
  final SuperheroesService superheroesService;

  RandomSuperheroUsecase(this.superheroesService);

  Future<SuperheroModel> call({@required List<SuperheroModel> items}) async {
    return Future.value(superheroesService.randomSuperhero(items: items));
  }
}
