import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:truth_or_dare/models/question_model.dart';
import 'package:truth_or_dare/viewmodels/question_viewmodel.dart';
import 'package:truth_or_dare/views/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  // Keep this commented until g.dart is generated
  // Hive.registerAdapter(QuestionAdapter());
  await Hive.openBox<Question>("questionsBox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestionViewModel()..init(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
