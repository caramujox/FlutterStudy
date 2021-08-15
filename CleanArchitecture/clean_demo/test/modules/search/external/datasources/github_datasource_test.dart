import 'dart:convert';

import 'package:clean_demo/modules/search/domain/errors/errors.dart';
import 'package:clean_demo/modules/search/external/datasources/github_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mocktail/mocktail.dart';
import '../../utils/const_github_response.dart';

class MockDio extends Mock implements Dio{}
@GenerateMocks([Dio])
main() {
  final dio = MockDio();
  final datasource = GitHubDataSource(dio);
  test('deve retornar lista de ResultSearchModel', () async {

    when(() => dio.get(
      "https://api.github.com/search/users?q=filipe",
    )).thenAnswer((_) async => Response(
        data: jsonDecode(gitHubResult),
        statusCode: 200,
        requestOptions: RequestOptions(path: "path")));

    final future = datasource.getSearch("filipe");

    expect(future, completes);
  });

  test('deve retornar erro se o código diferente 200', () async {

    when(() => dio.get(
      "https://api.github.com/search/users?q=filipe",
    )).thenAnswer((_) async => Response(
        data: null,
        statusCode: 400,
        requestOptions: RequestOptions(path: "path")));

    final future = datasource.getSearch("filipe");

    expect(future, throwsA(isA<DataSourceError>()));
  });

  test('deve retornar erro se tiver erro no DIO', () async {

    when(() => dio.get(
      "https://api.github.com/search/users?q=filipe",
    )).thenThrow(Exception());

    final future = datasource.getSearch("filipe");

    expect(future, throwsA(isA<Exception>()));
  });
}
