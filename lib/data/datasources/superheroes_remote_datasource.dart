import 'dart:convert';

import 'package:rd_app/core/errors/exceptions.dart';
import 'package:rd_app/core/framework/constants.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:http/http.dart' as http;

abstract class SuperheroesRemoteDatasource {
  Future<List<SuperheroModel>> requestSuperheroes();
}

class SuperheroesRemoteDatasourceImpl implements SuperheroesRemoteDatasource {
  final http.Client client;

  SuperheroesRemoteDatasourceImpl(this.client);

  @override
  Future<List<SuperheroModel>> requestSuperheroes() async {
    final uri = Uri.parse(URL_ALL);

    final response = await client.get(uri);

    List<SuperheroModel> superheroModelList;

    if (response.statusCode == 200) {
      Iterable list = json.decode(response.body);

      superheroModelList =
          list.map((model) => SuperheroModel.fromJson(model)).toList();

      return superheroModelList;
    } else {
      throw ServerException();
    }
  }
}
