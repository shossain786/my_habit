import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_habit/services/mutala_service.dart';
import 'package:my_habit/widgets/my_navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddMutalaScreen extends StatefulWidget {
  const AddMutalaScreen({super.key});

  @override
  State<AddMutalaScreen> createState() => _AddMutalaScreenState();
}

class _AddMutalaScreenState extends State<AddMutalaScreen> {
  final mutalaService = MutalaService();
  final _formKey = GlobalKey<FormState>();
  final _ayatNoController = TextEditingController();
  final _surahNoController = TextEditingController();
  final _pageNoController = TextEditingController();
  final _hadisRefController = TextEditingController();
  final _otherDetailsController = TextEditingController();

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

  void _clearFields() {
    _ayatNoController.clear();
    _surahNoController.clear();
    _pageNoController.clear();
    _hadisRefController.clear();
    _otherDetailsController.clear();
  }

  Future<void> _saveData() async {
    _savedData.add({
      'ayat': _ayatNoController.text,
      'surah': _surahNoController.text,
      'page': _pageNoController.text,
      'hadis': _hadisRefController.text,
      'other': _otherDetailsController.text
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = json.encode(_savedData);
    await prefs.setString('savedData', encodedData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Muta\'la'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: TextFormField(
                    maxLength: 20,
                    controller: _surahNoController,
                    decoration: const InputDecoration(
                      labelText: 'Surah Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Surah Number';
                      }
                      return null;
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLength: 3,
                        controller: _ayatNoController,
                        decoration: const InputDecoration(
                          labelText: 'Ayat Number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Ayat Number';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: TextFormField(
                        maxLength: 4,
                        controller: _pageNoController,
                        decoration: const InputDecoration(
                          labelText: 'Page Number',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Page Number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: _hadisRefController,
                  decoration: const InputDecoration(
                    labelText: 'Hadis Reference',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _otherDetailsController,
                  decoration: const InputDecoration(
                    labelText: 'Other Details',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: _clearFields,
                      child: const Text('Clear'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _saveData();
                            _clearFields();
                          });
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
