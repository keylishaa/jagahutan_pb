import 'package:flutter/material.dart';
import 'package:jagahutan_pb/LoginUser.dart';
import 'package:jagahutan_pb/transition.dart';
import 'DashboardPage.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2E6),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Admin",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF536956),
                ),
              ),
              const SizedBox(height: 40),

              // Name Input (Sesuai Gambar Login Admin ada field Nama)
              _buildLabel("Nama"),
              _buildInput("Masukkan Nama Anda"),
              const SizedBox(height: 20),

              // Email Input
              _buildLabel("Email"),
              _buildInput("Masukkan Email"),
              const SizedBox(height: 20),

              // Password Input
              _buildLabel("Password"),
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
                    backgroundColor: const Color(0xFF536956),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Masuk ke Dashboard sebagai Admin
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPage()),
                          (route) => false,
                    );
                  },
                  child: const Text("Login Admin",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),

              // Link Balik ke User Login
              GestureDetector(
                onTap: () {
                  // Pop untuk kembali ke halaman sebelumnya (Login User)
                  Navigator.pop(
                      context,
                    SmoothRoute(page: const LoginUser()),
                  );
                },
                child: const Text("Login sebagai User",
                    style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(text, style: TextStyle(color: Colors.grey[800])),
      ),
    );
  }

  Widget _buildInput(String hint) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFCDE4D3),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}