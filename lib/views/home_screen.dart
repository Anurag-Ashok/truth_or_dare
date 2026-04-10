import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/question_viewmodel.dart';
import 'game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void start(BuildContext context, String type) {
    Provider.of<QuestionViewModel>(context, listen: false).startGame(type);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const GameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Truth or Dare")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => start(context, "truth"),
              child: const Text("Truth"),
            ),
            ElevatedButton(
              onPressed: () => start(context, "dare"),
              child: const Text("Dare"),
            ),
          ],
        ),
      ),
    );
  }
}
