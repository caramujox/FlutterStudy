// Mocks generated by Mockito 5.0.13 from annotations
// in clean_demo/test/modules/search/infra/repositories/search_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:clean_demo/modules/search/infra/datasource/search_datasource.dart'
    as _i2;
import 'package:clean_demo/modules/search/infra/models/result_search_model.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [SearchDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockSearchDataSource extends _i1.Mock implements _i2.SearchDataSource {
  MockSearchDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.ResultSearchModel>> getSearch(String? searchText) =>
      (super.noSuchMethod(Invocation.method(#getSearch, [searchText]),
              returnValue: Future<List<_i4.ResultSearchModel>>.value(
                  <_i4.ResultSearchModel>[]))
          as _i3.Future<List<_i4.ResultSearchModel>>);
  @override
  String toString() => super.toString();
}