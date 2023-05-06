import 'package:cat_trivia/domain/repository/repository.dart';
import 'package:cat_trivia/presentation/fact_history_screen/bloc/fact_history_cubit.dart';
import 'package:cat_trivia/presentation/fact_history_screen/usecase/get_fact_history_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactHistoryPage extends StatelessWidget {
  const FactHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FactHistoryCubit>(
      create: (context) => FactHistoryCubit(
        getFactHistoryUsecase: GetFactHistoryUsecase(
          repository: context.read<Repository>(),
        ),
      )..getSavedFacts(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<FactHistoryCubit, FactHistoryState>(
          builder: (context, state) {
            if (state is FactHistoryLoaded && state.savedFacts != null) {
              return ListView.builder(
                itemCount: state.savedFacts!.length,
                itemBuilder: (context, index) =>
                    Text(state.savedFacts![index].text),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}