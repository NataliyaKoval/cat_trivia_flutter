import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/domain/repository/repository.dart';
import 'package:cat_trivia/domain/use_case/use_case.dart';

class GetRandomFactUseCase extends NoParamsUseCase<Fact> {
  GetRandomFactUseCase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<Fact> call() async {
    return await repository.getAndSaveRandomFact();
  }
}