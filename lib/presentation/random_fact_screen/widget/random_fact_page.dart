import 'package:cat_trivia/consts/strings.dart';
import 'package:cat_trivia/domain/repository/repository.dart';
import 'package:cat_trivia/presentation/fact_history_screen/widget/fact_history_page.dart';
import 'package:cat_trivia/presentation/random_fact_screen/bloc/random_fact_cubit.dart';
import 'package:cat_trivia/presentation/random_fact_screen/use_case/get_random_fact_use_case.dart';
import 'package:cat_trivia/presentation/random_fact_screen/widget/cat_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RandomFactPage extends StatelessWidget {
  const RandomFactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomFactCubit>(
      create: (context) => RandomFactCubit(
        getRandomFactUseCase: GetRandomFactUseCase(
          repository: context.read<Repository>(),
        ),
      )..getRandomFact(),
      child: BlocListener<RandomFactCubit, RandomFactState>(
        listener: (BuildContext context, RandomFactState state) {
          if (state is RandomFactError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: Text(Strings.randomFactPageStrings.pageName)),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            child: Builder(builder: (context) {
              return Column(
                children: [
                  Expanded(
                    child: BlocBuilder<RandomFactCubit, RandomFactState>(
                      builder: (BuildContext context, RandomFactState state) {
                        if (state is RandomFactLoaded) {
                          return CatCard(
                            text: state.randomFactText,
                            date: state.randomFactDate,
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<RandomFactCubit>().getRandomFact();
                    },
                    child: Text(
                      Strings.randomFactPageStrings.newFactButton,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FactHistoryPage(),
                        ),
                      );
                    },
                    child: Text(
                      Strings.randomFactPageStrings.historyButton,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
