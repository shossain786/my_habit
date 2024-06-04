import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayMutalaScreen extends StatefulWidget {
  const DisplayMutalaScreen({super.key});

  @override
  State<DisplayMutalaScreen> createState() => _DisplayMutalaScreenState();
}

class _DisplayMutalaScreenState extends State<DisplayMutalaScreen> {
  List<Map<String, String>> _savedData = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('savedData');
    if (data != null) {
      List<dynamic> decodedData = json.decode(data);
      setState(() {
        _savedData =
            decodedData.map((item) => Map<String, String>.from(item)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Muta\'las')),
      body: _savedData.isEmpty
          ? const Center(child: Text('No data saved'))
          : ListView.builder(
              itemCount: _savedData.length,
              itemBuilder: (context, index) {
                final data = _savedData[index];
                return ListTile(
                  title: Text(
                      'Ayat: ${data['ayat']} Surah: ${data['surah']} Page: ${data['page']}'),
                  subtitle: Text(
                    'Hadis: ${data['hadis']} \nOther Details: ${data['other']}',
                  ),
                );
              },
            ),
    );
  }
}
