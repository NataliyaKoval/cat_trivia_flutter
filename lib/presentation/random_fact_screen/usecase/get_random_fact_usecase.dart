import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/domain/repository/repository.dart';
import 'package:cat_trivia/domain/usecase/usecase.dart';

class GetRandomFactUsecase extends NoParamsUseCase<Fact> {
  GetRandomFactUsecase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<Fact> call() async {
    return await repository.getRandomFact();
  }
}