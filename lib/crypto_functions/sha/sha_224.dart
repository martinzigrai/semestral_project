import 'dart:convert';

import 'package:cryptography/cryptography.dart';

class Sha_224 {

  Future<void> getHash(var text) async {
    final message = utf8.encode(text);
    final algorithm = Sha224();
    final hash = await algorithm.hash(message);
    print('Hash SHA224: ${hash.bytes}');
  }
}