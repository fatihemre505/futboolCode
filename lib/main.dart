import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:football_predictions/providers/prediction_provider.dart';
import 'package:football_predictions/screens/home_screen.dart';
import 'package:football_predictions/theme/app_theme.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PredictionProvider(),
      child: MaterialApp(
        title: 'Football Predictions',
        theme: AppTheme.lightTheme,
        home: const HomeScreen(),
      ),
    );
  }
}