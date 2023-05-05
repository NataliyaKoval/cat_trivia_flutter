import 'package:cat_trivia/data/datasources/rest_api_client.dart';
import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.restApiClient,
  });

  final RestApiClient restApiClient;

  @override
  Future<Fact> getRandomFact() async {
    return restApiClient.getRandomFact();
  }
}
