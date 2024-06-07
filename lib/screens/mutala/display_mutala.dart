import 'dart:convert';

import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:my_habit/widgets/my_navbar.dart';
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
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ExpansionTileCard(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ayat Number: ${data['ayat']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            'Page: ${data['page']}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        'Surah Number: ${data['surah']}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      children: [
                        const Divider(
                          height: 2,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Hadis:\n ${data['hadis']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Other Details:\n ${data['other']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
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
