import 'package:cat_trivia/data/entity/fact_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabase {
  final Box<FactEntity> factsBox = Hive.box<FactEntity>('facts');

  void saveRandomFact(FactEntity fact) {
    factsBox.add(fact);
  }

  List<FactEntity>? getSavedFacts() {
    return factsBox.values.toList();
  }
}