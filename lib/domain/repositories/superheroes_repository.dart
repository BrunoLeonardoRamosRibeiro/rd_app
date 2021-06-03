import 'package:dartz/dartz.dart';
import 'package:rd_app/core/errors/failures.dart';
import 'package:rd_app/data/models/superhero_model.dart';


abstract class SuperheroesRepository {

  Future<Either<Failure, List<SuperheroModel>>> getAll();


}