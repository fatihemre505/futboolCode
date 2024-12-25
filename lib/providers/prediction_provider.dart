import 'package:flutter/foundation.dart';
import 'package:football_predictions/models/league.dart';
import 'package:football_predictions/models/match.dart';
import 'package:football_predictions/models/prediction.dart';
import 'package:football_predictions/services/gemini_service.dart';

class PredictionProvider with ChangeNotifier {
  final GeminiService _geminiService = GeminiService();
  List<League> _leagues = [];
  List<Match> _matches = [];
  Prediction? _currentPrediction;
  bool _isLoading = false;

  List<League> get leagues => _leagues;
  List<Match> get matches => _matches;
  Prediction? get currentPrediction => _currentPrediction;
  bool get isLoading => _isLoading;

  Future<void> loadLeagues() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulated data - replace with actual API call
      _leagues = [
        League(id: '1', name: 'Premier League', country: 'England'),
        League(id: '2', name: 'La Liga', country: 'Spain'),
        League(id: '3', name: 'Bundesliga', country: 'Germany'),
      ];
    } catch (e) {
      print('Error loading leagues: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadMatches(String leagueId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Simulated data - replace with actual API call
      _matches = [
        Match(
          id: '1',
          homeTeam: 'Team A',
          awayTeam: 'Team B',
          matchTime: DateTime.now().add(const Duration(days: 1)),
          leagueId: leagueId,
        ),
        // Add more matches
      ];
    } catch (e) {
      print('Error loading matches: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> getPrediction(String matchId) async {
    _isLoading = true;
    notifyListeners();

    try {
      final match = _matches.firstWhere((m) => m.id == matchId);
      final prediction = await _geminiService.getPrediction(
        match.homeTeam,
        match.awayTeam,
      );
      
      // Process the prediction response and update the UI
      // This is a simplified example
      _currentPrediction = Prediction(
        matchId: matchId,
        predictedScore: prediction,
        confidence: '85%',
        statistics: {},
      );
    } catch (e) {
      print('Error getting prediction: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}