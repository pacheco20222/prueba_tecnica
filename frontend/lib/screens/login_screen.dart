import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'dashboard_screen.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(); // Changed from username to email
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  void _handleLogin() async {
    setState(() => _isLoading = true);
    
    final email = _emailController.text;
    final password = _passwordController.text;
    final success = await _authService.login(email, password);
    setState(() => _isLoading = false);
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Check credentials.')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Text('Sign In to continue', style: TextStyle(fontSize: 18)),
              SizedBox(height: 26),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                obscureText: true,
              ),
              SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                   style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF3B62FF),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: _isLoading 
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Login', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}