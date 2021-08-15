import 'package:clean_demo/modules/search/domain/entity/result_search.dart';
import 'package:clean_demo/modules/search/domain/errors/errors.dart';
import 'package:clean_demo/modules/search/infra/datasource/search_datasource.dart';
import 'package:clean_demo/modules/search/infra/models/result_search_model.dart';
import 'package:clean_demo/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'search_repository_impl_test.mocks.dart';


//class SearchDataSourceMock extends Mock implements SearchDataSource{}
@GenerateMocks([SearchDataSource])
main() {
  final datasource = MockSearchDataSource();
  final repository = SearchRepositoryImpl(datasource);
  test('deve retornar uma lista de ResultSearch',() async{
    when(datasource.getSearch("any")).thenAnswer((_) async => <ResultSearchModel>[]);
    final result = await repository.search("any");

    expect(result | [] , isA<List<ResultSearch>>());
  });
  test('deve retornar DataSourceError se Datasource falhar',() async{
    when(datasource.getSearch("any")).thenThrow(DataSourceError("message"));    
    final result = await repository.search("any");

    expect(result.fold(id, id), isA<DataSourceError>());
  });
  test('deve retornar GenericError se outra falha acontecer',() async{
    when(datasource.getSearch("any")).thenThrow(Exception());    
    final result = await repository.search("any");

    expect(result.fold(id, id), isA<GenericFailure>());
  });
}