import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rd_app/data/models/superhero_model.dart';

import 'package:rd_app/domain/repositories/superheroes_service.dart';
import 'package:rd_app/domain/usecases/search_by_name_usecase.dart';

class SuperheroesServiceMock extends Mock implements SuperheroesService {}

class ListSuperheroes extends Mock implements List<SuperheroModel> {}

void main() {
  final superheroesService = SuperheroesServiceMock();

  final usecase = SearchByNameUsecase(superheroesService);

  final items = ListSuperheroes();

  test('Deve retonar uma lista de SuperheroModel', () async {
    when(superheroesService.filterByName(
            items: items, name: 'spider', gender: 'Male'))
        .thenAnswer((realInvocation) async => <SuperheroModel>[]);

    final result = await usecase(items: items, name: 'spider', gender: 'Male');

    expect(result, isA<List<SuperheroModel>>());
  });
}
