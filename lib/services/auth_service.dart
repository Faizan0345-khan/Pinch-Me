import 'package:supabase_flutter/supabase_flutter.dart';
import 'supabase_service.dart';

class AuthService {
  final SupabaseService _supabase = SupabaseService();

  Future<void> signUp(String email, String password, String username) async {
    try {
      await _supabase.client.auth.signUp(
        email: email,
        password: password,
        data: {
          'username': username,
          'created_at': DateTime.now().toIso8601String(),
        },
      );
    } catch (e) {
      throw Exception('Sign up failed: $e');
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _supabase.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw Exception('Sign in failed: $e');
    }
  }

  Future<void> signOut() async {
    await _supabase.signOut();
  }

  User? getCurrentUser() {
    return _supabase.currentUser;
  }
}
