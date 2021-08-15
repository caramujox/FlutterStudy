abstract class FailureSearch implements Exception {}

class GenericFailure implements FailureSearch{}

class InvalidTextError implements FailureSearch{}

class DataSourceError implements FailureSearch{
  final String message;

  DataSourceError(this.message);
}