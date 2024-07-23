import 'package:bio_metrics/app/app.dart';
import 'package:bio_metrics/main.dart';
import 'package:flutter/material.dart';
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
        home: SafeArea(child: const BasePage()));
  }
}

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Bio Metrics'),
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
                      controller: emailController,
                      decoration: InputDecoration(hintText: "Email Address"),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Password"),
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
                            email: emailController.text,
                            password: passwordController.text);
                    if (response.user != null && response.session != null) {
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
