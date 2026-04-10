import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/question_viewmodel.dart';
import '../viewmodels/theme_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  String question = "Press Truth or Dare";

  @override
  Widget build(BuildContext context) {
    final vm = context.read<QuestionViewModel>();
    final themeVM = context.read<ThemeViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Truth or Dare"),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () => themeVM.toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(question, textAlign: TextAlign.center),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  question = vm.getTruth();
                });
              },
              child: const Text("Truth"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  question = vm.getDare();
                });
              },
              child: const Text("Dare"),
            ),
          ],
        ),
      ),
    );
  }
}
