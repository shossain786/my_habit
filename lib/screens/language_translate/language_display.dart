import 'dart:convert';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiplayLanguageScreen extends StatefulWidget {
  const DiplayLanguageScreen({super.key});

  @override
  State<DiplayLanguageScreen> createState() => _DiplayLanguageScreenState();
}

class _DiplayLanguageScreenState extends State<DiplayLanguageScreen> {
  List<Map<String, String>> _savedLangData = [];
  @override
  void initState() {
    super.initState();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? data = prefs.getString('savedData');
    if (data != null) {
      List<dynamic> decodedData = json.decode(data);
      setState(() {
        _savedLangData =
            decodedData.map((item) => Map<String, String>.from(item)).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Translated Data'),
      ),
      body: _savedLangData.isEmpty
          ? const Center(child: Text('No data to display'))
          : ListView.builder(
              itemCount: _savedLangData.length,
              itemBuilder: (context, index) {
                final data = _savedLangData[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                    ),
                    child: ExpansionTileCard(
                      leading: CircleAvatar(
                        child: Text('$index'),
                      ),
                      title: const Text(
                        'Input Text: ',
                        style: TextStyle(fontSize: 28),
                      ),
                      subtitle: const Text(
                        'Output Text:',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        const Divider(
                          height: 1,
                          thickness: 2,
                        ),
                        const SizedBox(height: 10),
                        Text('${data['others']}'),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
