import 'package:flutter/material.dart';
import 'package:my_habit/screens/data_entry.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DataEntryScreen(),
            ),
          );
        },
        label: const Text('Log Your Activity'),
      ),
    );
  }
}
