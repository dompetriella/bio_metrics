import 'package:bio_metrics/app/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String apiKey = const String.fromEnvironment('API_KEY');
  String baseUrl = const String.fromEnvironment('BASE_URL');

  await Supabase.initialize(url: baseUrl, anonKey: apiKey);
  runApp(const ProviderScope(child: MyApp()));
}

final supabase = Supabase.instance.client;
