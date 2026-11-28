import 'package:flutter/material.dart';
import 'package:first_sprint_version_demo/Logic/nfc_scanner.dart';

import 'Custom/custom_table.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  String? _uid;

  Future<void> readCard() async {
    _uid = await NfcScanner.poll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Scanner Demo'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("the Scanned ID: $_uid"),
            ElevatedButton(
              onPressed: () async {
                await readCard();
              },
              child: Text('Scan NFC Card'),
            ),
          ],
        ),
      ),
    );
  }
}
