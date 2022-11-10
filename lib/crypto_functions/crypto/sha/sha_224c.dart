import 'dart:convert';
import 'package:crypto/crypto.dart';

class Sha_224c {

  void getHash(var text){
    var message = utf8.encode(text);
    var digest = sha224.convert(message);

    print(digest.bytes);
    print(digest);

  }

}