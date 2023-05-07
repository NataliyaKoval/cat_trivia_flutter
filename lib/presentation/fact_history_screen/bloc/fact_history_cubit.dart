import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/presentation/fact_history_screen/usecase/get_fact_history_usecase.dart';
import 'package:cat_trivia/utils/app_error.dart';
import 'package:cat_trivia/utils/date_formatting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fact_history_state.dart';

class FactHistoryCubit extends Cubit<FactHistoryState> {
  FactHistoryCubit({required this.getFactHistoryUsecase})
      : super(FactHistoryInitial());

  final GetFactHistoryUsecase getFactHistoryUsecase;

  Future<void> getSavedFacts() async {
    try {
      List<Fact>? facts = await getFactHistoryUsecase.call();
      List<Fact>? mappedFacts = facts
          ?.map((el) {
            String date = el.updatedAt;
            String newDateString = DateFormatting.formatDateString(date);
            return Fact(text: el.text, updatedAt: newDateString);
          })
          .toList()
          .reversed
          .toList();
      emit(FactHistoryLoaded(savedFacts: mappedFacts));
    } on AppError catch (e) {
      emit(FactHistoryError(errorMessage: e.message));
    }
  }
}
