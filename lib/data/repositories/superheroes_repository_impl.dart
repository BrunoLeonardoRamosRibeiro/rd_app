import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:rd_app/core/errors/exceptions.dart';
import 'package:rd_app/core/errors/failures.dart';
import 'package:rd_app/data/datasources/superheroes_remote_datasource.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/domain/entities/superhero.dart';
import 'package:rd_app/domain/repositories/superheroes_repository.dart';

class SuperheroesRepositoryImpl implements SuperheroesRepository {
  final SuperheroesRemoteDatasource remoteDatasource;

  SuperheroesRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<Failure, List<SuperheroModel>>> getAll() async {
    try {
      final superheroes = await remoteDatasource.requestSuperheroes();
      return Right(superheroes);
    } on ServerException {
      return Left(ServerFailure(
          message: "Ocorreu um erro ao obter os dados do servidor!"));
    }
  }
}
