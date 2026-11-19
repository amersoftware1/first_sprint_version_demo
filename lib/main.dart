import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData(useMaterial3: true), home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  String? uid;
  Future<void> scanNfc() async {
    try {
      // Wait for an NFC card
      NFCTag tag = await FlutterNfcKit.poll();

      print(tag.id);
      setState(() {
        uid = tag.id;
      });
    } catch (e) {
      print('NFC Error: $e');
    } finally {
      await FlutterNfcKit.finish();
      print("Scanning Stopped ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scanner Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UID: ${uid ?? "UID not found"}"),
            ElevatedButton(
              onPressed: () {
                scanNfc();
                print("Started Scanning ");
              },
              child: Text('Scan NFC Card'),
            ),
          ],
        ),
      ),
    );
  }
}
