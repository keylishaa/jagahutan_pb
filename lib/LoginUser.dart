import 'package:flutter/material.dart';
import 'LoginAdmin.dart';
import 'Signup.dart';
import 'DashboardPage.dart';
import 'transition.dart';

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  State<LoginUser> createState() => _LoginUserState();
}

class _LoginUserState extends State<LoginUser> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2E6), // Light Green bg
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF536956),
                ),
              ),
              const SizedBox(height: 40),

              // Email Input
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email", style: TextStyle(color: Colors.grey[800]))),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFCDE4D3),
                  hintText: "Masukkan Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password Input
              Align(
                  alignment: Alignment.centerLeft,
                  child:
                  Text("Password", style: TextStyle(color: Colors.grey[800]))),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFCDE4D3),
                  hintText: "Masukkan Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF536956), // Dark Green Button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Navigasi: Hapus semua route sebelumnya dan mulai fresh di Dashboard
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPage()),
                          (route) => false,
                    );
                  },
                  child: const Text("Login", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),

              // Link ke Admin
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SmoothRoute(page: const LoginAdmin()),
                  );
                },
                child: const Text("Login sebagai Admin",
                    style: TextStyle(color: Colors.grey)),
              ),

              const SizedBox(height: 40),

              // Link ke Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        SmoothRoute(page: const SignupUser()),
                      );
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}