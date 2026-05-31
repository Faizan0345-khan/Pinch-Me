import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final SupabaseService _instance = SupabaseService._internal();
  factory SupabaseService() => _instance;
  SupabaseService._internal();

  SupabaseClient get client => Supabase.instance.client;

  User? get currentUser => Supabase.instance.client.auth.currentUser;

  bool get isLoggedIn => currentUser != null;

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
