import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/question_viewmodel.dart';

class AddQuestionScreen extends StatefulWidget {
  const AddQuestionScreen({super.key});

  @override
  State<AddQuestionScreen> createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final TextEditingController controller = TextEditingController();
  String type = "truth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Question")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Enter question"),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: type,
              items: const [
                DropdownMenuItem(value: "truth", child: Text("Truth")),
                DropdownMenuItem(value: "dare", child: Text("Dare")),
              ],
              onChanged: (val) {
                setState(() {
                  type = val!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<QuestionViewModel>(
                  context,
                  listen: false,
                ).addQuestion(controller.text, type);

                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
