import 'package:flutter/material.dart';
import 'package:my_habit/main.dart';
import 'package:my_habit/widgets/my_floatingaction.dart';
import 'package:my_habit/widgets/my_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 100,
                width: double.infinity,
                child: Card(
                  color: kColorScheme.onSecondary,
                  borderOnForeground: true,
                  elevation: 10,
                  child: const ListTile(
                    title: Text(
                      'Max Spent Time ON',
                      style: TextStyle(fontSize: 35),
                    ),
                    subtitle: Text(
                      'Sleeping: 48 Hours 54 Min',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                height: 100,
                width: double.infinity,
                child: Card(
                  color: kColorScheme.onSecondary,
                  borderOnForeground: true,
                  elevation: 10,
                  child: const ListTile(
                    title: Text(
                      '2nd Max Spent Time ON',
                      style: TextStyle(fontSize: 26),
                    ),
                    subtitle: Text(
                      'Work: 21 Hours 16 Min',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const MyFloatingActionBtn(),
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
