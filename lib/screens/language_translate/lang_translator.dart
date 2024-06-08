import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

class LangTranslate extends StatefulWidget {
  const LangTranslate({super.key});

  @override
  State<LangTranslate> createState() => _LangTranslateState();
}

class _LangTranslateState extends State<LangTranslate> {
  List<String> languages = [
    'Arabic',
    'Bengali',
    'Hindi',
    'English',
    'Marathi',
    'Urdu'
  ];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var outPut = "";
  final TextEditingController _languageController = TextEditingController();
  String? selectedItem;
  GoogleTranslator translator = GoogleTranslator();
  List<Map<String, String>> _savedData = [];

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
        _savedData =
            decodedData.map((item) => Map<String, String>.from(item)).toList();
      });
    }
  }

  Future<void> _saveData() async {
    debugPrint('data to add $originLanguage, $destinationLanguage');
    _savedData.add({
      'inputString': _languageController.text,
      'outPutString': outPut,
      'otherData': '',
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = json.encode(_savedData);
    await prefs.setString('savedLngData', encodedData);
    debugPrint('Data added Successfully');
  }

  void langTranslate(String src, String dest, String input) async {
    if (input.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter some text!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    debugPrint('SRC: $src, dest: $dest, input: $input');
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      outPut = translation.toString();
    });
  }

  String getLanguageCode(String lang) {
    switch (lang) {
      case 'Hindi':
        return 'hi';
      case 'English':
        return 'en';
      case 'Arabic':
        return 'ar';
      case 'Bengali':
        return 'bn';
      case 'Urdu':
        return 'ur';
      case 'Marathi':
        return 'mr';
      default:
        return 'en';
    }
  }

  void _copyText() {
    Clipboard.setData(ClipboardData(text: outPut));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Text Copied!'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Translate Language',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Container(
                padding: const EdgeInsetsDirectional.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        hint: Text(originLanguage),
                        value: selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            originLanguage = newValue!;
                          });
                        },
                        items: languages
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                    const SizedBox(width: 40),
                    const Icon(Icons.arrow_right_alt_rounded),
                    const SizedBox(width: 40),
                    Expanded(
                      child: DropdownButton<String>(
                        hint: Text(destinationLanguage),
                        value: selectedItem,
                        onChanged: (String? newValue) {
                          setState(() {
                            destinationLanguage = newValue!;
                          });
                        },
                        items: languages
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsetsDirectional.all(10),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: 'Please enter your text...',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _languageController.clear();
                    },
                    icon: const Icon(Icons.clear_rounded),
                  ),
                ),
                validator: (value) {
                  debugPrint(value);
                  if (value == null || value.isEmpty) {
                    return 'Please enter text';
                  }
                  if (_languageController.text.trim().isEmpty) {
                    return 'Please enter text';
                  }
                  return null;
                },
                controller: _languageController,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.all(10),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    langTranslate(
                        getLanguageCode(originLanguage),
                        getLanguageCode(destinationLanguage),
                        _languageController.text);
                  },
                  child: const Text(
                    'Translate',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      outPut,
                      style: const TextStyle(fontSize: 24),
                    ),
                    if (outPut.isNotEmpty)
                      IconButton(
                        onPressed: _copyText,
                        icon: const Icon(Icons.copy_rounded),
                      ),
                    if (outPut.isNotEmpty)
                      IconButton(
                        onPressed: _saveData,
                        icon: const Icon(Icons.add_shopping_cart_rounded),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
