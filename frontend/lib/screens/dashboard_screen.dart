import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/requests_service.dart';
import '../models/request_model.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthService _authService = AuthService();
  final RequestsService _requestsService = RequestsService();
  late Future<List<RequestModel>> _requestsFuture;

  @override
  void initState(){
    super.initState();
    _requestsFuture = _requestsService.getRequests();
  }

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
        title: Text("Requests"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          )
        ],
      ),
      body: FutureBuilder<List<RequestModel>>(
        future: _requestsFuture,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text('No Requests have been found for you'));
          }

          final requests = snapshot.data!;
          return ListView.builder(
            itemCount: requests.length,
            itemBuilder: (context, index) {
              final req = requests[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: ListTile(
                  title: Text(req.title, style: TextStyle(fontWeight:FontWeight.bold)),
                  subtitle: Text(req.status),
                  trailing: Text(req.createdAt.split('T')[0]),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Here create request still not added.
        },
        child: Icon(Icons.add),
      ),
    );
  }
}