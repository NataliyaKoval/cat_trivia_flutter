import 'dart:io';

import 'package:cat_trivia/domain/repository/repository.dart';
import 'package:cat_trivia/presentation/random_fact_screen/bloc/random_fact_cubit.dart';
import 'package:cat_trivia/presentation/random_fact_screen/usecase/get_random_fact_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class RandomFactPage extends StatelessWidget {
  const RandomFactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RandomFactCubit>(
      create: (context) => RandomFactCubit(
        getRandomFactUsecase: GetRandomFactUsecase(
          repository: context.read<Repository>(),
        ),
      )..getRandomFact(),
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: BlocBuilder<RandomFactCubit, RandomFactState>(
            builder: (BuildContext context, RandomFactState state) {
              if (state is RandomFactLoaded) {
                return Column(
                  children: [
                    Text(state.randomFactText),
                    Text(state.randomFactDate),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}