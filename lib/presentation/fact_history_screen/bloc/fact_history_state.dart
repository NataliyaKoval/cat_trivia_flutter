part of 'fact_history_cubit.dart';

@immutable
abstract class FactHistoryState {}

class FactHistoryInitial extends FactHistoryState {}

class FactHistoryLoaded extends FactHistoryState {
  FactHistoryLoaded({
    this.savedFacts,
  });

  final List<Fact>? savedFacts;
}

class FactHistoryError extends FactHistoryState {
  FactHistoryError({
    required this.errorMessage,
  });

  final String errorMessage;
}
