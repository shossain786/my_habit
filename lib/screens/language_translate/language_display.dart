// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:my_habit/widgets/my_navbar.dart';
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
    _loadData();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('savedLngData');
    if (data != null) {
      List<dynamic> decodedData = json.decode(data);
      setState(() {
        _savedLangData =
            decodedData.map((item) => Map<String, String>.from(item)).toList();
      });
    }
  }

  void _deleteItem(int index) async {
    setState(() {
      _savedLangData.removeAt(index);
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('savedLngData', json.encode(_savedLangData));
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Card removed successfully')));
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ExpansionTileCard(
                      leading: CircleAvatar(
                        child: Text('$index'),
                      ),
                      title: Text(
                        'Input: ${data['inputString']}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        'Output: ${data['outPutString']}',
                        style: const TextStyle(
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
                        Text('${data['otherData']}'),
                        const SizedBox(height: 10),
                        const Divider(
                          height: 1,
                          thickness: 2,
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_forever_rounded),
                          onPressed: () {
                            debugPrint('Id to delete: $index');
                            _deleteItem(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
