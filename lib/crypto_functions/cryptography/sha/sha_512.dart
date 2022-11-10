import 'dart:convert';

import 'package:cryptography/cryptography.dart';

class Sha_512 {

  Future<void> getHash(var text) async {
    final message = utf8.encode(text);
    final algorithm = Sha512();
    final hash = await algorithm.hash(message);
    print('Hash SHA512: ${hash.bytes}');
  }
}