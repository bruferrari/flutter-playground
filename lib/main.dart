import 'package:flutter/material.dart';
import 'package:namer_app/data/words_repository.dart';
import 'package:namer_app/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'presentation/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final WordsRepository repository = WordsRepository();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(repository),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
