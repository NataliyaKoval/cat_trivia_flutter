part of 'random_fact_cubit.dart';

@immutable
abstract class RandomFactState {}

class RandomFactInitial extends RandomFactState {}

class RandomFactLoaded extends RandomFactState {
  RandomFactLoaded({
    required this.randomFactText,
    required this.randomFactDate,
  });

  final String randomFactText;
  final String randomFactDate;

}
