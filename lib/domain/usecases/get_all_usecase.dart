import 'package:dartz/dartz.dart';
import 'package:rd_app/core/errors/failures.dart';
import 'package:rd_app/domain/entities/superhero.dart';
import 'package:rd_app/domain/repositories/superheroes_repository.dart';

class GetAllUsecase {
  final SuperheroesRepository superheroesRepository;

  GetAllUsecase(this.superheroesRepository);

  Future<Either<Failure, List<Superhero>>> call() async {
    return superheroesRepository.getAll();
  }
  
}