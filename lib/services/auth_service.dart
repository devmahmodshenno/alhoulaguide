import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {

  static final SupabaseClient _client = Supabase.instance.client;

  static User? get currentUser => _client.auth.currentUser;

  static bool get isSignedIn => currentUser!=null;

  static Future<void> signInAnonymouslyIfNeeded() async{
    await _client.auth.signInAnonymously();
  }
}