import 'package:clean_demo/modules/search/domain/entity/result_search.dart';
import 'package:clean_demo/modules/search/domain/errors/errors.dart';
import 'package:clean_demo/modules/search/domain/repositories/search_repository.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:dartz/dartz.dart';

abstract class SearchByText {
  Future<Either<FailureSearch, List<ResultSearch>>>call(String searchText);
}

class SearchByTextImpl implements SearchByText {

  final SearchRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<ResultSearch>>> call(String searchText) async {
      var option = optionOf(searchText);
      return option.fold(() => Left(InvalidTextError()), (text)  async {
        var result =  await repository.search(searchText); 
        return result.where((r) => r.isNotEmpty, () => GenericFailure());
      } );
  }

  
}