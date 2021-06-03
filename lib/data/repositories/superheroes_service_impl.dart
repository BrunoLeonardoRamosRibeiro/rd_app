import 'package:flutter/material.dart';
import 'package:rd_app/data/datasources/superheroes_local_datasource.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/domain/repositories/superheroes_service.dart';

class SuperheroesServiceImpl implements SuperheroesService {
  final SuperheroesLocalDatasource localDatasource;

  SuperheroesServiceImpl(this.localDatasource);

  @override
  Future<List<SuperheroModel>> filterByName(
      {@required List<SuperheroModel> items,
      @required String name,
      @required String gender}) async {
    final response = await localDatasource.filterByName(
        items: items, name: name, gender: gender);
    return response;
  }

  @override
  Future<SuperheroModel> randomSuperhero({@required List<SuperheroModel> items}) async {
    final response = await localDatasource.randomSuperhero(items: items);
    return response;
  }

}
