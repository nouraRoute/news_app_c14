import 'package:flutter/material.dart';
import 'package:news_app_c14/common/theme/app_theme.dart';
import 'package:news_app_c14/features/categories/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      theme: AppTheme.lightTheme,
      routes: {
        HomeScreen.routeNme: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeNme,
    );
  }
}
