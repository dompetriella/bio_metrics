import 'dart:convert';

import 'package:bio_metrics/app/app.dart';
import 'package:bio_metrics/app/state/app_state.dart';
import 'package:bio_metrics/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert' show utf8, base64;

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Biometrics',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: SafeArea(
            child: LoginPage(
          prefs: prefs,
        )));
  }
}

class LoginPage extends StatefulHookConsumerWidget {
  final SharedPreferences prefs;
  const LoginPage({super.key, required this.prefs});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var appStateActions = ref.watch(appStateProvider.notifier);
      String? username;
      String? password;
      if (widget.prefs.getString('username') != null ||
          widget.prefs.getString('password') != null) {
        username = widget.prefs.getString('username');
        var encodedPassword = widget.prefs.getString('password');
        password = utf8.decode(base64.decode(encodedPassword!));
      } else {
        print('username/password is null');
        return;
      }

      AuthResponse response = await supabase.auth
          .signInWithPassword(email: username, password: password);
      if (response.user != null && response.session != null) {
        appStateActions.setUserState(response.user);
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PageShell()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Username and password incorrect')));
      }

      setState(() => _isLoading = false); //
    });
  }

  @override
  Widget build(BuildContext context) {
    var appStateActions = ref.watch(appStateProvider.notifier);

    var emailState = useState('');
    var passwordState = useState('');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text('Bio Metrics')),
      ),
      body: Stack(
        children: [
          Center(
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
                          decoration:
                              InputDecoration(hintText: "Email Address"),
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
                          if (widget.prefs.getString('username') == null) {
                            widget.prefs
                                .setString('username', emailState.value);
                          }
                          if (widget.prefs.getString('password') == null) {
                            final encodedPassword =
                                base64.encode(utf8.encode(passwordState.value));
                            widget.prefs.setString('password', encodedPassword);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PageShell()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text('Username and password incorrect')));
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
          if (_isLoading)
            Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bio Metrics'),
                    SizedBox(
                      height: 8,
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
