import 'package:cat_trivia/data/datasources/local_database.dart';
import 'package:cat_trivia/data/datasources/rest_api_client.dart';
import 'package:cat_trivia/data/entity/fact_entity.dart';
import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/domain/repository/repository.dart';
import 'package:cat_trivia/utils/app_error.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.restApiClient,
    required this.localDatabase,
  });

  final RestApiClient restApiClient;
  final LocalDatabase localDatabase;

  @override
  Future<Fact> getAndSaveRandomFact() async {
    FactEntity factEntity = await execute(() => restApiClient.getRandomFact());
    localDatabase.saveRandomFact(factEntity);
    return factEntity;
  }

  @override
  List<Fact>? getSavedFacts() {
    return localDatabase.getSavedFacts();
  }
}
