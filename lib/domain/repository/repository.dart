import 'package:cat_trivia/domain/models/fact.dart';

abstract class Repository {
  Future<Fact> getAndSaveRandomFact();

  List<Fact> getSavedFacts();
}
