import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rd_app/data/models/superhero_model.dart';
import 'package:rd_app/domain/repositories/superheroes_service.dart';
import 'package:rd_app/domain/usecases/random_superhero_usecase.dart';

class SuperheroesServiceMock extends Mock implements SuperheroesService {}

class ListSuperheroes extends Mock implements List<SuperheroModel> {}

class SuperheroMock extends Mock implements SuperheroModel{}

void main() {
  final superheroesService = SuperheroesServiceMock();

  final usecase = RandomSuperheroUsecase(superheroesService);

  final items = ListSuperheroes();

  final superhero = SuperheroMock();

  test('Deve retonar um SuperheroModel', () async {
    when(superheroesService.randomSuperhero(items: items))
        .thenAnswer((realInvocation) async => superhero);

    final result = await usecase(items: items);

    expect(result, isA<SuperheroModel>());
  });
}
