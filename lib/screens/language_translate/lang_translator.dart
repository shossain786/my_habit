// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_habit/main.dart';
import 'package:my_habit/widgets/my_navbar.dart';
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
  final TextEditingController _otherController = TextEditingController();
  String? selectedOriginLanguage;
  String? selectedDestinationLanguage;
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
    if (_otherController.text.isEmpty) {}
    _savedData.add({
      'inputString': _languageController.text,
      'outPutString': outPut,
      'otherData':
          _otherController.text.isNotEmpty ? _otherController.text : '',
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = json.encode(_savedData);
    await prefs.setString('savedLngData', encodedData);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data added Successfully!'),
        backgroundColor: Colors.green,
      ),
    );
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
    try {
      var translation = await translator.translate(input, from: src, to: dest);
      setState(() {
        outPut = translation.toString();
        debugPrint('Translation: $outPut');
      });
    } catch (e) {
      debugPrint('Error translating: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Translation failed of the text $input. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
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
            const SizedBox(height: 10),
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
                        value: selectedOriginLanguage,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedOriginLanguage = newValue;
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
                        value: selectedDestinationLanguage,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDestinationLanguage = newValue;
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
            const SizedBox(height: 20),
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
            const SizedBox(height: 10),
            if (outPut.isNotEmpty)
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: kColorScheme.onPrimaryContainer,
                    )),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Output: $outPut',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: TextFormField(
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          hintText: 'Other details',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0),
                          ),
                        ),
                        maxLines: 2,
                        controller: _otherController,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _saveData,
                            label: const Text('Add'),
                            icon: Icon(
                              Icons.add_shopping_cart_rounded,
                              color: kColorScheme.onSecondary,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                _otherController.clear();
                              });
                            },
                            label: const Text('Clear'),
                            icon: Icon(
                              Icons.clear_rounded,
                              color: kColorScheme.onSecondary,
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: _copyText,
                            label: const Text('Copy'),
                            icon: Icon(
                              Icons.copy_rounded,
                              color: kColorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
