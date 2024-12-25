import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:football_predictions/providers/prediction_provider.dart';
import 'package:football_predictions/models/league.dart';

class LeagueSelector extends StatelessWidget {
  const LeagueSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PredictionProvider>(
      builder: (context, provider, child) {
        final leagues = provider.leagues;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Select League',
              border: OutlineInputBorder(),
            ),
            items: leagues.map((League league) {
              return DropdownMenuItem<String>(
                value: league.id,
                child: Text('${league.name} (${league.country})'),
              );
            }).toList(),
            onChanged: (String? leagueId) {
              if (leagueId != null) {
                provider.loadMatches(leagueId);
              }
            },
          ),
        );
      },
    );
  }
}