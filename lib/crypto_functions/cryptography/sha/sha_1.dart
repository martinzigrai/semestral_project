import 'dart:convert';

import 'package:cryptography/cryptography.dart';

class Sha_1 {

  Future<void> getHash(var text) async{
    final message = utf8.encode(text);
    final algorithm = Sha1();
    final hash = await algorithm.hash(message);
    print('Hash SHA1: ${hash.bytes}');
  }

}