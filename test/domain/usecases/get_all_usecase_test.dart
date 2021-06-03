import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/domain/repositories/superheroes_repository.dart';
import 'package:rd_app/domain/usecases/get_all_usecase.dart';
import 'package:dartz/dartz.dart';

class SuperheroesRepositoryMock extends Mock implements SuperheroesRepository {}

void main() async {

  final superheroesRepository = SuperheroesRepositoryMock();

  final usecase = GetAllUsecase(superheroesRepository);

  test('Deve retonar uma lista de Superhero', () async {
    when(superheroesRepository.getAll())
        .thenAnswer((realInvocation) async => Right(<SuperheroModel>[]));

    final result = await usecase();

    expect(result | null, isA<List<SuperheroModel>>());
  });

}
