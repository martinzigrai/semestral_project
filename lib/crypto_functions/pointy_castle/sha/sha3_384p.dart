import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

class Sha3_384p {
  Uint8List sha384Digest(Uint8List dataToDigest){
    final d = SHA3Digest(384);

    return d.process(dataToDigest);
  }

  void getHash(var text){
    final hash = sha384Digest(utf8.encode(text) as Uint8List);
    print('SHA3-384p: $hash');
  }
}