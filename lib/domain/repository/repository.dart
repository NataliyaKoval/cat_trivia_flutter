import 'package:cat_trivia/data/entity/fact_entity.dart';
import 'package:cat_trivia/domain/models/fact.dart';

abstract class Repository {
  Future<Fact> getAndSaveRandomFact();

  List<Fact>? getSavedFacts();
}
