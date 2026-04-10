import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/language_viewmodel.dart';
import '../viewmodels/question_viewmodel.dart';
import 'home_screen.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  void select(BuildContext context, String lang) async {
    context.read<LanguageViewModel>().setLang(lang);
    await context.read<QuestionViewModel>().init(lang);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Language")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => select(context, "en"),
            child: const Text("English"),
          ),
          ElevatedButton(
            onPressed: () => select(context, "ml"),
            child: const Text("Malayalam"),
          ),
          ElevatedButton(
            onPressed: () => select(context, "ta"),
            child: const Text("Tamil"),
          ),
        ],
      ),
    );
  }
}
