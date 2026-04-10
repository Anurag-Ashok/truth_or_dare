import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'viewmodels/theme_viewmodel.dart';
import 'viewmodels/language_viewmodel.dart';
import 'viewmodels/question_viewmodel.dart';
import 'views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => LanguageViewModel()),
        ChangeNotifierProvider(create: (_) => QuestionViewModel()),
      ],
      child: Consumer<ThemeViewModel>(
        builder: (_, themeVM, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeVM.theme,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
