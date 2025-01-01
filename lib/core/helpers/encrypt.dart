import 'package:encrypt/encrypt.dart';
import 'package:logman/logman.dart';

const String _key = 'fgp7834tre79853-04qwt98yrehghrtu';

String encryptString(String input) {
  String encryptedResult = '';
  try {
    final key = Key.fromUtf8(_key);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(input, iv: iv);
    encryptedResult = '${encrypted.base64}:${iv.base64}';
  } catch (e) {
    Logman.instance.info(e.toString());
  }
  return encryptedResult;
}

String decryptString(String input) {
  String decrypted = '';
  try {
    final key = Key.fromUtf8(_key);
    final parts = input.split(':');
    final encryptedData = parts[0];
    final iv = IV.fromBase64(parts[1]);
    final encrypter = Encrypter(AES(key));
    decrypted = encrypter.decrypt(Encrypted.from64(encryptedData), iv: iv);
  } catch (e) {
    Logman.instance.info(e.toString());
  }
  return decrypted;
}
