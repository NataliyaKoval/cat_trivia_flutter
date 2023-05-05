import 'package:cat_trivia/di/providers.dart';
import 'package:cat_trivia/presentation/random_fact_screen/widget/random_fact_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

void main() {
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Providers providers;

  @override
  void initState() {
    super.initState();
    providers = Providers();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers.providers,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Cat Trivia',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const RandomFactPage(),
          );
        },
      ),
    );
  }
}
