part of 'random_fact_cubit.dart';

@immutable
abstract class RandomFactState {}

class RandomFactInitial extends RandomFactState {}

class RandomFactLoaded extends RandomFactState {
  final Fact randomFact;

  RandomFactLoaded({
    required this.randomFact,
  });
}

