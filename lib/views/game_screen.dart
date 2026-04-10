import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/question_viewmodel.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<QuestionViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text(vm.currentType)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              vm.currentQuestion?.text ?? "Press Next",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: vm.nextQuestion,
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
