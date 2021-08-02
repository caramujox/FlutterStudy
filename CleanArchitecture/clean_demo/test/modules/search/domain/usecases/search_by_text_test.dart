import 'package:clean_demo/modules/search/domain/entity/result_search.dart';
import 'package:clean_demo/modules/search/domain/errors/errors.dart';
import 'package:clean_demo/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_demo/modules/search/domain/usecases/search_by_text.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_by_text_test.mocks.dart';

// class SearchRepositoryMock extends Mock implements SearchRepository {}

@GenerateMocks([SearchRepository])
main() {
  final repository = MockSearchRepository();
  final usecase = SearchByTextImpl(repository);
  test('Deve retornar Lista de ResultSearch', () async {
    when(repository.search("caio"))
        .thenAnswer((_) async => right(<ResultSearch>[]));
    final result = await usecase("caio");
    expect(result | [], isA<List<ResultSearch>>());
  });

  test('Deve retornar InvalidTextError caso texto vazio', () async {
    when(repository.search(""))
        .thenAnswer((_) async => left(InvalidTextError()));//right(<ResultSearch>[]));
        final result = await usecase("");
        expect(result.fold((l) => l, (r) => r), isA<InvalidTextError>());
  });
}
