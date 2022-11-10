import 'dart:convert';

import 'package:cryptography/cryptography.dart';

class Sha_256 {

  Future<void> getHash(var text) async {
    final message = utf8.encode(text);
    final algorithm = Sha256();
    final hash = await algorithm.hash(message);
    print('Hash SHA256: ${hash.bytes}');
  }
}