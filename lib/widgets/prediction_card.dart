import 'package:flutter/material.dart';
import 'package:football_predictions/models/prediction.dart';

class PredictionCard extends StatelessWidget {
  final Prediction prediction;

  const PredictionCard({
    super.key,
    required this.prediction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Predicted Score',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
                prediction.predictedScore,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
              Text(
                'Confidence: ${prediction.confidence}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              const Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Add more statistics widgets here based on the prediction.statistics
            ],
          ),
        ),
      ),
    );
  }
}