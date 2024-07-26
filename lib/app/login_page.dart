import 'package:bio_metrics/app/app.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:bio_metrics/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Biometrics',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: SafeArea(child: const LoginPage()));
  }
}

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appStateActions = ref.watch(appStateProvider.notifier);

    var emailState = useState('');
    var passwordState = useState('');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text('Bio Metrics')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: "Email Address"),
                      onChanged: (value) => emailState.value = value,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
                      onChanged: (value) => passwordState.value = value,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: () async {
                    AuthResponse response = await supabase.auth
                        .signInWithPassword(
                            email: emailState.value,
                            password: passwordState.value);
                    if (response.user != null && response.session != null) {
                      appStateActions.setUserState(response.user);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PageShell()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Username and password incorrect')));
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
