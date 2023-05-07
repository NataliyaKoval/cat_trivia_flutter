import 'dart:io';
import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/presentation/random_fact_screen/usecase/get_random_fact_usecase.dart';
import 'package:cat_trivia/utils/app_error.dart';
import 'package:cat_trivia/utils/date_formatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'random_fact_state.dart';

class RandomFactCubit extends Cubit<RandomFactState> {
  RandomFactCubit({
    required this.getRandomFactUsecase,
  }) : super(RandomFactInitial());

  final GetRandomFactUsecase getRandomFactUsecase;

  Future<void> getRandomFact() async {
    try {
      Fact randomFact = await getRandomFactUsecase.call();
      String newDateString =
          DateFormatting.formatDateString(randomFact.updatedAt);

      emit(RandomFactLoaded(
          randomFactText: randomFact.text, randomFactDate: newDateString));
    } on AppError catch (e) {
      emit(RandomFactError(errorMessage: e.message));
    }
  }
}
