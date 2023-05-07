import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/domain/repository/repository.dart';
import 'package:cat_trivia/domain/usecase/usecase.dart';

class GetFactHistoryUsecase extends NoParamsUseCase<List<Fact>?> {
  GetFactHistoryUsecase({
    required this.repository,
  });

  final Repository repository;

  @override
  Future<List<Fact>?> call() async {
    return repository.getSavedFacts();
  }
}
