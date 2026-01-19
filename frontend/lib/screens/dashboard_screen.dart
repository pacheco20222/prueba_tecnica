import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService _authService = AuthService();

  void _logout() async {
    await _authService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Requests'),
        actions: [IconButton(icon: Icon(Icons.logout), onPressed: _logout)],
      ),
      body: Center(child: Text('Dashboard works!')),
    );
  }
}
