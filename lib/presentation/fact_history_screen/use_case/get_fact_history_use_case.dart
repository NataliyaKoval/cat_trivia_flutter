import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/domain/repository/repository.dart';
import 'package:cat_trivia/domain/use_case/use_case.dart';

class GetFactHistoryUseCase extends NoParamsUseCase<List<Fact>> {
  GetFactHistoryUseCase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<List<Fact>> call() async {
    return repository.getSavedFacts();
  }
}
