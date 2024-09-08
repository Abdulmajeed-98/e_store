import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('$x'),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  x++;
                });
              },
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}
