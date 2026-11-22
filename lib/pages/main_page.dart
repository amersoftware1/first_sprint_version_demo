// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  String? uid;
  bool isScanningActive = false;

  Future<void> scanNfc() async {
    try {
      // Wait for an NFC card
      var tag = await FlutterNfcKit.poll();

      print(tag.id);
      setState(() {
        uid = tag.id;
      });
    } catch (e) {
      print('NFC Error: $e');
    } finally {
      await FlutterNfcKit.finish();
      setState(() {
        isScanningActive = false;
      });
      print("Scanning Stopped ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Scanner Demo'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$isScanningActive",
              style: TextStyle(
                fontSize: 30,
                color: isScanningActive ? Colors.green : Colors.red,
              ),
            ),
            Text("UID: ${uid ?? "UID not found"}"),
            ElevatedButton(
              onPressed: () {
                scanNfc();
                print("Started Scanning ");
                setState(() {
                  isScanningActive = true;
                });
              },
              child: Text('Scan NFC Card'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  print("UID cleared");
                  uid = null;
                });
              },
              child: Text("Clean Scanned Data"),
            ),
          ],
        ),
      ),
    );
  }
}
