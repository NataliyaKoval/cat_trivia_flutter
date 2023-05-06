import 'package:cat_trivia/domain/models/fact.dart';
import 'package:cat_trivia/presentation/fact_history_screen/usecase/get_fact_history_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fact_history_state.dart';

class FactHistoryCubit extends Cubit<FactHistoryState> {
  FactHistoryCubit({required this.getFactHistoryUsecase})
      : super(FactHistoryInitial());

  final GetFactHistoryUsecase getFactHistoryUsecase;

  Future<void> getSavedFacts() async {
    List<Fact>? facts = await getFactHistoryUsecase.call();
    emit(FactHistoryLoaded(savedFacts: facts));
  }
}
