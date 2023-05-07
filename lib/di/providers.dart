import 'package:cat_trivia/data/datasources/local_database.dart';
import 'package:cat_trivia/data/datasources/rest_api_client.dart';
import 'package:cat_trivia/data/repository/repository_impl.dart';
import 'package:cat_trivia/domain/repository/repository.dart';
import 'package:cat_trivia/themes/app_theme.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  List<SingleChildWidget> get providers => <SingleChildWidget>[
        Provider<Dio>(
          create: (BuildContext context) => Dio(),
        ),
        Provider<RestApiClient>(
          create: (BuildContext context) => RestApiClient(
            context.read<Dio>(),
          ),
        ),
        Provider<LocalDatabase>(
          create: (BuildContext context) => LocalDatabase(),
        ),
        Provider<Repository>(
          create: (BuildContext context) => RepositoryImpl(
            restApiClient: context.read<RestApiClient>(),
            localDatabase: context.read<LocalDatabase>(),
          ),
        ),
        Provider<AppTheme>(
          create: (BuildContext context) => AppTheme(),
        ),
      ];
}
