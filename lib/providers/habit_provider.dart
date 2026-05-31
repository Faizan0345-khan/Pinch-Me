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
        userId: 'mock_user',
        name: 'Drink a glass of water',
        currentStreak: 3,
        totalTimeSpent: 5,
        unit: 'min',
        progress: 40,
        isCompleted: false,
      ),
      Habit(
        userId: 'mock_user',
        name: 'Meditate to relax',
        currentStreak: 6,
        totalTimeSpent: 15,
        unit: 'min',
        progress: 27,
        isCompleted: false,
      ),
      Habit(
        userId: 'mock_user',
        name: 'Stretch for 10 minutes',
        currentStreak: 5,
        totalTimeSpent: 10,
        unit: 'min',
        progress: 33,
        isCompleted: false,
      ),
      Habit(
        userId: 'mock_user',
        name: 'Go for a short walk',
        currentStreak: 3,
        totalTimeSpent: 0,
        unit: 'min',
        progress: 48,
        isCompleted: false,
      ),
    ];

    _updateTodayHabits();
    notifyListeners();
  }

  void addHabit(Habit habit) {
    _habits.add(habit);
    _updateTodayHabits();
    notifyListeners();
  }

  void updateHabit(Habit habit) {
    final index = _habits.indexWhere((h) => h.id == habit.id);
    if (index != -1) {
      _habits[index] = habit;
      _updateTodayHabits();
      notifyListeners();
    }
  }

  void deleteHabit(String id) {
    _habits.removeWhere((h) => h.id == id);
    _updateTodayHabits();
    notifyListeners();
  }

  void toggleHabitCompletion(Habit habit) {
    habit.isCompleted = !habit.isCompleted;
    if (habit.isCompleted) {
      habit.currentStreak++;
      if (habit.currentStreak > habit.longestStreak) {
        habit.longestStreak = habit.currentStreak;
      }
      habit.lastCompletedDate = DateTime.now();
      habit.pointsEarned += 10;
    } else {
      habit.currentStreak--;
      habit.pointsEarned -= 10;
    }
    updateHabit(habit);
  }

  void _updateTodayHabits() {
    _todayHabits = List.from(_habits);
  }

  int getTotalPoints() {
    return _habits.fold(0, (sum, habit) => sum + habit.pointsEarned);
  }

  int getCompletedTodayCount() {
    return _todayHabits.where((h) => h.isCompleted).length;
  }

  double getTodayProgress() {
    if (_todayHabits.isEmpty) return 0;
    return getCompletedTodayCount() / _todayHabits.length;
  }
}
