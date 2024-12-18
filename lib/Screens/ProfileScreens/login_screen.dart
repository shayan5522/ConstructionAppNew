import 'package:TotalSurvey/Screens/ProfileScreens/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../CustomWidgets/custom_buttons.dart';
import '../../CustomWidgets/custom_text_widget.dart';
import '../../CustomWidgets/custom_textfield.dart';
import '../BottomBarScreens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // Authenticate the user with Firebase
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Navigate to HomeScreen after successful login
      Get.off(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      // Show error message
      Get.snackbar('Login Error', e.message ?? 'Failed to login');
    } catch (e) {
      Get.snackbar('Error', 'An unexpected error occurred');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          text: 'Login',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const CustomTextWidget(
                text: 'Welcome Back!',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const CustomTextWidget(
                text: 'Login to continue.',
                fontSize: 16,
                color: Colors.grey,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              // Email Field
              CustomTextField(
                controller: _emailController,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Password Field
              CustomTextField(
                controller: _passwordController,
                labelText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // Login Button
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                text: 'Login',
                onPressed: _login,
              ),
              const SizedBox(height: 20),
              // Signup Navigation
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextWidget(
                    text: 'Don’t have an account?',
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignupScreen());
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
