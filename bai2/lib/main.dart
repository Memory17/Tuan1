import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CoolNameGeneratorApp());
}

class CoolNameGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cool Name Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NameGeneratorScreen(),
    );
  }
}

class NameGeneratorScreen extends StatefulWidget {
  @override
  _NameGeneratorScreenState createState() => _NameGeneratorScreenState();
}

class _NameGeneratorScreenState extends State<NameGeneratorScreen> {
  String _generatedName = "Click the button to generate a cool name";

  List<String> _prefixes = ['new', 'light', 'main', 'gray'];
  List<String> _suffixes = ['stay', 'stream', 'brake', 'pine'];

  void _generateName() {
    final random = Random();
    String prefix = _prefixes[random.nextInt(_prefixes.length)];
    String suffix = _suffixes[random.nextInt(_suffixes.length)];
    setState(() {
      _generatedName = '$prefix$suffix';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cool Name Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _generatedName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateName,
              child: Text('Generate Name'),
            ),
          ],
        ),
      ),
    );
  }
}