import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:football_predictions/providers/prediction_provider.dart';
import 'package:football_predictions/screens/prediction_screen.dart';
import 'package:football_predictions/widgets/league_selector.dart';
import 'package:football_predictions/widgets/match_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<PredictionProvider>().loadLeagues(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Football Predictions'),
      ),
      body: Consumer<PredictionProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              const LeagueSelector(),
              Expanded(
                child: MatchList(
                  onMatchTap: (matchId) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PredictionScreen(matchId: matchId),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}