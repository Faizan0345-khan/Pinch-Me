import 'package:flutter/material.dart';
import '../models/habit.dart';

class HabitProvider extends ChangeNotifier {
  List<Habit> _habits = [];
  List<Habit> _todayHabits = [];

  List<Habit> get habits => _habits;
  List<Habit> get todayHabits => _todayHabits;

  void loadMockData() {
    _habits = [
      Habit(
        name: 'Drink a glass of water',
        currentStreak: 3,
        totalTimeSpent: 5,
        unit: 'min',
        progress: 40,
      ),
      Habit(
        name: 'Meditate to relax',
        currentStreak: 6,
        totalTimeSpent: 15,
        unit: 'min',
        progress: 27,
      ),
      Habit(
        name: 'Stretch for 10 minutes',
        currentStreak: 5,
        totalTimeSpent: 10,
        unit: 'min',
        progress: 33,
      ),
      Habit(
        name: 'Go for a short walk',
        currentStreak: 3,
        totalTimeSpent: 0,
        unit: 'min',
        progress: 48,
      ),
    ];

    _updateTodayHabits();
    notifyListeners();
  }

  void _updateTodayHabits() {
    _todayHabits = List.from(_habits);
  }

  int getTotalPoints() {
    return _habits.length * 10;
  }

  int getCompletedTodayCount() {
    return _todayHabits.where((h) => h.isCompleted).length;
  }

  double getTodayProgress() {
    if (_todayHabits.isEmpty) return 0;
    return getCompletedTodayCount() / _todayHabits.length;
  }
}
