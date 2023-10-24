import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';
export 'storage/storage.dart';

const _kSupabaseUrl = 'https://zigbtihbwqghofeurmcw.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InppZ2J0aWhid3FnaG9mZXVybWN3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTc3MDU4MTAsImV4cCI6MjAxMzI4MTgxMH0.WmvtSjDm8JoEq1_N0zcM0DPvlsyNAsZQUQf8nuH8L4A';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
        debug: false,
      );
}
