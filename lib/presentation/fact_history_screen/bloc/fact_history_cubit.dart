import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/presentation/fact_history_screen/use_case/get_fact_history_use_case.dart';
import 'package:cat_trivia/utils/app_error.dart';
import 'package:cat_trivia/utils/date_formatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fact_history_state.dart';

class FactHistoryCubit extends Cubit<FactHistoryState> {
  FactHistoryCubit({required this.getFactHistoryUseCase})
      : super(FactHistoryInitial());

  final GetFactHistoryUseCase getFactHistoryUseCase;

  Future<void> getSavedFacts() async {
    try {
      List<Fact>? facts = await getFactHistoryUseCase.call();
      List<Fact>? mappedFacts = facts.reversed.map((fact) {
        String newDateString = DateFormatting.formatDateString(fact.updatedAt);
        return Fact(text: fact.text, updatedAt: newDateString);
      }).toList();
      emit(FactHistoryLoaded(savedFacts: mappedFacts));
    } on AppError catch (e) {
      emit(FactHistoryError(errorMessage: e.message));
    }
  }
}
