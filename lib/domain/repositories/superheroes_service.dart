import 'package:flutter/material.dart';
import 'package:rd_app/data/models/superhero_model.dart';

abstract class SuperheroesService {
  Future<List<SuperheroModel>> filterByName(
      {@required List<SuperheroModel> items,
      @required String name,
      @required String gender});

  Future<SuperheroModel> randomSuperhero({@required List<SuperheroModel> items});
}
