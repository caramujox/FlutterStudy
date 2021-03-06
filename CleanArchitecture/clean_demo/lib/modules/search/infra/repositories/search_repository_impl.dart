import 'package:clean_demo/modules/search/domain/errors/errors.dart';
import 'package:clean_demo/modules/search/domain/entity/result_search.dart';
import 'package:clean_demo/modules/search/domain/repositories/search_repository.dart';
import 'package:clean_demo/modules/search/infra/datasource/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository{

  final SearchDataSource dataSource;

  SearchRepositoryImpl(this.dataSource);

  
  @override
  Future<Either<FailureSearch, List<ResultSearch>>> search(String searchText) async {
    try {
      final result = await dataSource.getSearch(searchText);
      
      return Right(result);
    } on DataSourceError catch (e) {
      return  Left(e);
    }
    catch (e){
      return Left(GenericFailure());
    }
  }

}