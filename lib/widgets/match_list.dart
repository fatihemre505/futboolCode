import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:football_predictions/providers/prediction_provider.dart';
import 'package:football_predictions/models/match.dart';

class MatchList extends StatelessWidget {
  final Function(String) onMatchTap;

  const MatchList({
    super.key,
    required this.onMatchTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PredictionProvider>(
      builder: (context, provider, child) {
        final matches = provider.matches;

        if (matches.isEmpty) {
          return const Center(
            child: Text('Select a league to see matches'),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: matches.length,
          itemBuilder: (context, index) {
            final match = matches[index];
            return MatchCard(
              match: match,
              onTap: () => onMatchTap(match.id),
            );
          },
        );
      },
    );
  }
}

class MatchCard extends StatelessWidget {
  final Match match;
  final VoidCallback onTap;

  const MatchCard({
    super.key,
    required this.match,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    match.homeTeam,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'vs',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    match.awayTeam,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Match Time: ${match.matchTime.toString()}',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}