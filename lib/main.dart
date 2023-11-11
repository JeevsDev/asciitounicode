import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UnicodeConversionDemo(),
    );
  }
}

class UnicodeConversionDemo extends StatelessWidget {
  String unicodeToASCII(String unicodeString) {
    StringBuffer asciiString = StringBuffer();
    for (int i = 0; i < unicodeString.runes.length; i++) {
      int codeUnit = unicodeString.runes.elementAt(i);
      asciiString.write(String.fromCharCode(codeUnit));
    }
    return asciiString.toString();
  }

  String asciiToUnicode(String asciiString) {
    StringBuffer unicodeString = StringBuffer();
    for (int i = 0; i < asciiString.runes.length; i++) {
      int codeUnit = asciiString.codeUnitAt(i);
      unicodeString.write(String.fromCharCode(codeUnit));
    }
    return unicodeString.toString();
  }

  String convertString(String inputString) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < inputString.length; i++) {
      if (inputString.runes.toList()[i] > 127) {
        result.write(unicodeToASCII(inputString[i]));
      } else {
        result.write(inputString[i]);
      }
    }
    return result.toString();
  }

  String convertBack(String inputString) {
    StringBuffer result = StringBuffer();
    for (int i = 0; i < inputString.length; i++) {
      if (inputString.runes.toList()[i] > 127) {
        result.write(asciiToUnicode(inputString[i]));
      } else {
        result.write(inputString[i]);
      }
    }
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    String message = "Hi How Are you? 😀"; // Your message with Unicode smiley

    String convertedMessage = convertString(message); // Convert to ASCII
    String convertedBack = convertBack(convertedMessage); // Convert back to Unicode

    return Scaffold(
      appBar: AppBar(
        title: Text('Handling ASCII and Unicode in Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Original Message: $message',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Converted Message: $convertedMessage',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Converted Back: $convertedBack',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
