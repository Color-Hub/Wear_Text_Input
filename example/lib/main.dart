import 'package:flutter/material.dart';
import 'package:wear_text_input/wear_text_input.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _wearTextInputPlugin = WearTextInput();
  String _resultText = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wear Text Input'),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: _onPressedButton,
                child: const Text(
                  "Get text",
                  textAlign: TextAlign.center,
                ),
              ),
              Text(_resultText),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onPressedButton() async {
    String? userInput = await _wearTextInputPlugin.getUserInput();
    if (userInput?.isNotEmpty == true) {
      setState(() {
        _resultText = userInput!;
      });
    }
  }
}
