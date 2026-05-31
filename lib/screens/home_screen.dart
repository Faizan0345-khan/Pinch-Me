import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/habit_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habitProvider = Provider.of<HabitProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Pinch Me'), centerTitle: true),
      body: Column(
        children: [
          // Progress Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple.shade700, Colors.purple.shade400],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'Today\'s Progress',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: habitProvider.getTodayProgress(),
                  backgroundColor: Colors.white.withOpacity(0.3),
                  color: Colors.white,
                  height: 10,
                  borderRadius: BorderRadius.circular(5),
                ),
                const SizedBox(height: 8),
                Text(
                  '${habitProvider.getCompletedTodayCount()} / ${habitProvider.todayHabits.length} Completed',
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          // Habits List
          Expanded(
            child: ListView.builder(
              itemCount: habitProvider.todayHabits.length,
              itemBuilder: (context, index) {
                final habit = habitProvider.todayHabits[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: Checkbox(
                      value: habit.isCompleted,
                      onChanged: (_) {
                        habitProvider.toggleHabitCompletion(habit);
                      },
                      activeColor: Colors.green,
                    ),
                    title: Text(
                      habit.name,
                      style: TextStyle(
                        decoration: habit.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    subtitle: Text('Streak: ${habit.currentStreak} days'),
                    trailing: Chip(
                      label: Text('${habit.totalTimeSpent} ${habit.unit}'),
                      backgroundColor: Colors.purple.shade100,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
