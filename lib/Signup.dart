import 'package:flutter/material.dart';
import 'package:jagahutan_pb/transition.dart';
import 'DashboardPage.dart';

class SignupUser extends StatefulWidget {
  const SignupUser({super.key});

  @override
  State<SignupUser> createState() => _SignupUserState();
}

class _SignupUserState extends State<SignupUser> {
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
                "Sign up",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF536956),
                ),
              ),
              const SizedBox(height: 30),

              _buildLabel("Nama Lengkap"),
              _buildInput("Masukkan Nama Anda"),
              const SizedBox(height: 15),

              _buildLabel("Nomor Telepon"),
              _buildInput("Masukkan Nomor Telepon", isNumber: true),
              const SizedBox(height: 15),

              _buildLabel("Email"),
              _buildInput("Masukkan Email"),
              const SizedBox(height: 15),

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

              // Sign Up Button
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
                    // Setelah Sign up, biasanya kembali ke Login atau langsung masuk Dashboard
                    // Disini kita kembali ke halaman Login (pop)
                    Navigator.pushAndRemoveUntil(
                        context,
                        SmoothRoute(page: const DashboardPage()),
                        (route) => false,
                    );
                  },
                  child:
                  const Text("Sign up", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),

              // Link Balik ke Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an Account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Kembali ke LoginUser
                    },
                    child: const Text(
                      "Login",
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

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(text, style: TextStyle(color: Colors.grey[800])),
      ),
    );
  }

  Widget _buildInput(String hint, {bool isNumber = false}) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
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