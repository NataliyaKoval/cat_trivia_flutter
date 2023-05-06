import 'package:cat_trivia/data/datasources/local_database.dart';
import 'package:cat_trivia/data/datasources/rest_api_client.dart';
import 'package:cat_trivia/data/entity/fact_entity.dart';
import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  const RepositoryImpl({
    required this.restApiClient,
    required this.localDatabase,
  });

  final RestApiClient restApiClient;
  final LocalDatabase localDatabase;

  @override
  Future<Fact> getAndSaveRandomFact() async {
    FactEntity factEntity = await restApiClient.getRandomFact();
    saveRandomFact(factEntity);
    return factEntity;
  }

  @override
  void saveRandomFact(FactEntity fact) {
    localDatabase.saveRandomFacts(fact);
  }

  @override
  List<Fact>? getSavedFacts() {
    return localDatabase.getSavedFacts();
  }


}
