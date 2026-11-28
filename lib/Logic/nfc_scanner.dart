import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

class NfcScanner {
  static List<String> scannedCards = [];

  static Future<String?> poll() async {
    String uid;
    try {
      print("scanning started");
      NFCTag nfcTag = await FlutterNfcKit.poll();
      uid = nfcTag.id;
      print(nfcTag.id);
    } catch (e) {
      return null;
    } finally {
      await FlutterNfcKit.finish();
      print("scanning finished");
    }

    scannedCards.add(uid);
    return uid;
  }
}
