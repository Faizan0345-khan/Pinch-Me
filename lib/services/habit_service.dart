import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';
import '../models/habit.dart';

class HabitService {
  final SupabaseService _supabase = SupabaseService();

  Future<List<Habit>> getHabits() async {
    final user = _supabase.currentUser;
    if (user == null) return [];

    final response = await _supabase.client
        .from('habits')
        .select()
        .eq('user_id', user.id)
        .order('created_at', ascending: false);

    return response.map<Habit>((json) => Habit.fromJson(json)).toList();
  }

  Future<void> addHabit(Habit habit) async {
    final user = _supabase.currentUser;
    if (user == null) throw Exception('User not logged in');

    await _supabase.client.from('habits').insert(habit.toJson());
  }

  Future<void> updateHabit(Habit habit) async {
    await _supabase.client
        .from('habits')
        .update(habit.toJson())
        .eq('id', habit.id!);
  }

  Future<void> deleteHabit(String id) async {
    await _supabase.client.from('habits').delete().eq('id', id);
  }

  Future<void> toggleCompletion(String id, bool isCompleted) async {
    await _supabase.client
        .from('habits')
        .update({
          'is_completed': isCompleted,
          'completed_at': isCompleted ? DateTime.now().toIso8601String() : null,
        })
        .eq('id', id);
  }
}
