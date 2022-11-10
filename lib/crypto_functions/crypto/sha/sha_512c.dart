import 'dart:convert';
import 'package:crypto/crypto.dart';

class Sha_512c {

  void getHash(var text){
    var message = utf8.encode(text);
    var digest = sha512.convert(message);

    print(digest.bytes);
    print(digest);

  }

}