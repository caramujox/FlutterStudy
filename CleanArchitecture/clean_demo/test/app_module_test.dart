

import 'dart:convert';

import 'package:clean_demo/app_module.dart';
import 'package:clean_demo/modules/search/domain/entity/result_search.dart';
import 'package:clean_demo/modules/search/domain/usecases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'modules/search/utils/const_github_response.dart';

class MockDio extends Mock implements Dio{}

main() {

  final dio = MockDio();

  initModules([AppModule()], replaceBinds: [
    Bind<Dio>((i) => dio),
  ]);
  
  test('Deve recuperar o usecase sem erro', (){

    final usecase = Modular.get<SearchByText>();

    expect(usecase, isA<SearchByTextImpl>());
  });
  
  test('Deve trazer uma lista de ResultSearch', () async {

    when(() => dio.get("https://api.github.com/search/users?q=filipe")).thenAnswer((_) async => Response(
        data: jsonDecode(gitHubResult),
        statusCode: 200,
        requestOptions: RequestOptions(path: "path")));

    final usecase = Modular.get<SearchByText>();
    final result = await usecase("caio");

    expect(result | [], isA<List<ResultSearch>>());
  });
}