import 'package:flutter/material.dart';
import 'package:flutter_course_chat_app_starter/controller/auth.dart';
import 'package:flutter_svg/svg.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          'assets/cpes.svg',
          width: 75,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Email Address',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              Container(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Password',
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
              ),
              Container(height: 70),
              Container(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // 1
                    Auth().login(
                      context,
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  child: const Text('Login'),
                ),
              ),
              Container(height: 15),
              Container(
                width: 120,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    // 2
                    Auth().signup(
                      context,
                      _emailController.text,
                      _passwordController.text,
                    );
                  },
                  child: const Text('Sign Up'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
