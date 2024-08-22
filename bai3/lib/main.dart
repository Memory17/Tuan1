import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  double _progress = 0.0;

  void _updateProgress(String text) {
    setState(() {
      // Increment progress based on how many fields are filled.
      _progress += text.isNotEmpty ? 0.33 : -0.33;
      if (_progress < 0) _progress = 0;
      if (_progress > 1) _progress = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
              ),
              onChanged: _updateProgress,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              onChanged: _updateProgress,
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,  // Chuyển obscureText vào đây
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              onChanged: _updateProgress,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _progress >= 1.0
                  ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sign In Successful!')),
                );
              }
                  : null,
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}