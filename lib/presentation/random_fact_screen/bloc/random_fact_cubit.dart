import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/presentation/random_fact_screen/use_case/get_random_fact_use_case.dart';
import 'package:cat_trivia/utils/app_error.dart';
import 'package:cat_trivia/utils/date_formatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_fact_state.dart';

class RandomFactCubit extends Cubit<RandomFactState> {
  RandomFactCubit({
    required this.getRandomFactUseCase,
  }) : super(RandomFactInitial());

  final GetRandomFactUseCase getRandomFactUseCase;

  Future<void> getRandomFact() async {
    try {
      Fact randomFact = await getRandomFactUseCase.call();

      String formattedString =
          DateFormatting.formatDateString(randomFact.updatedAt);

      emit(RandomFactLoaded(
          randomFactText: randomFact.text, randomFactDate: formattedString));
    } on AppError catch (e) {
      emit(RandomFactError(errorMessage: e.message));
    }
  }
}
