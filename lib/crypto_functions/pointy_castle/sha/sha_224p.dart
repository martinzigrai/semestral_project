import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

class Sha_224p {
  Uint8List sha224Digest(Uint8List dataToDigest){
    final d = SHA224Digest();

    return d.process(dataToDigest);
  }

  void getHash(var text){
    final hash = sha224Digest(utf8.encode(text) as Uint8List);
    print('SHA-224p: $hash');
  }
}