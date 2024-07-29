import 'package:bio_metrics/app/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String apiKey = const String.fromEnvironment('API_KEY');
  String baseUrl = const String.fromEnvironment('BASE_URL');
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await Supabase.initialize(url: baseUrl, anonKey: apiKey);
  runApp(ProviderScope(
      child: MyApp(
    prefs: prefs,
  )));
}

final supabase = Supabase.instance.client;
