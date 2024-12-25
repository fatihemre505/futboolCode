import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:football_predictions/providers/prediction_provider.dart';
import 'package:football_predictions/widgets/prediction_card.dart';

class PredictionScreen extends StatefulWidget {
  final String matchId;

  const PredictionScreen({
    super.key,
    required this.matchId,
  });

  @override
  State<PredictionScreen> createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<PredictionProvider>().getPrediction(widget.matchId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Prediction'),
      ),
      body: Consumer<PredictionProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final prediction = provider.currentPrediction;
          if (prediction == null) {
            return const Center(
              child: Text('Failed to load prediction'),
            );
          }

          return PredictionCard(prediction: prediction);
        },
      ),
    );
  }
}